from datetime import datetime
from decimal import Decimal
from fastapi import APIRouter, Depends, HTTPException, Form
from sqlalchemy.orm import Session
from ..db import get_db
from ..models import DebtPayment, Customer, Collector
from ..auth import get_current_active_user, require_roles, UserRole

router = APIRouter(prefix="/debts")


@router.post("/pay")
async def record_payment(
	customer_id: int = Form(...),
	amount: Decimal = Form(...),
	collector_id: int | None = Form(None),
	note: str | None = Form(None),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.cashier)),
):
	c = db.query(Customer).get(customer_id)
	if not c:
		raise HTTPException(404, detail="عميل غير موجود")
	if amount <= 0:
		raise HTTPException(400, detail="مبلغ غير صالح")
	payment = DebtPayment(customer_id=customer_id, amount=amount, paid_at=datetime.utcnow(), note=note, collector_id=collector_id)
	db.add(payment)
	# خصم من إجمالي المديونية المسجلة على العميل
	c.total_debt = (c.total_debt or 0) - Decimal(amount)
	db.commit()
	return {"id": payment.id}


@router.get("/payments")
async def list_payments(db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	items = db.query(DebtPayment).order_by(DebtPayment.paid_at.desc()).limit(500).all()
	return [{
		"id": p.id,
		"customer_id": p.customer_id,
		"collector_id": p.collector_id,
		"amount": float(p.amount),
		"paid_at": p.paid_at.isoformat(),
		"note": p.note or "",
	} for p in items]