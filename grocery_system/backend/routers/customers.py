from typing import Optional
from decimal import Decimal
from fastapi import APIRouter, Depends, HTTPException, Form, Query
from sqlalchemy.orm import Session
from sqlalchemy import or_, func
from ..db import get_db
from ..models import Customer, DebtPayment, Sale
from ..auth import get_current_active_user, require_roles, UserRole

router = APIRouter(prefix="/customers")


@router.get("/")
async def list_customers(q: Optional[str] = Query(default=None), page: int = 1, page_size: int = 50, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	query = db.query(Customer)
	if q:
		like = f"%{q}%"
		query = query.filter(or_(Customer.name.like(like), Customer.phone.like(like)))
	total = query.count()
	items = query.order_by(Customer.id.desc()).offset((page-1)*page_size).limit(page_size).all()
	return {"total": total, "items": [
		{"id": c.id, "name": c.name, "phone": c.phone, "address": c.address, "total_debt": float(c.total_debt or 0)} for c in items
	]}


@router.post("/")
async def create_customer(name: str = Form(...), phone: Optional[str] = Form(None), address: Optional[str] = Form(None), db: Session = Depends(get_db), user = Depends(require_roles(UserRole.admin, UserRole.cashier))):
	c = Customer(name=name, phone=phone, address=address)
	db.add(c)
	db.commit()
	return {"id": c.id}


@router.put("/{customer_id}")
async def update_customer(customer_id: int, name: Optional[str] = Form(None), phone: Optional[str] = Form(None), address: Optional[str] = Form(None), db: Session = Depends(get_db), user = Depends(require_roles(UserRole.admin, UserRole.cashier))):
	c = db.query(Customer).get(customer_id)
	if not c:
		raise HTTPException(404, detail="غير موجود")
	if name is not None:
		c.name = name
	if phone is not None:
		c.phone = phone
	if address is not None:
		c.address = address
	db.commit()
	return {"status": "ok"}


@router.get("/{customer_id}/debt")
async def customer_debt(customer_id: int, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	c = db.query(Customer).get(customer_id)
	if not c:
		raise HTTPException(404, detail="غير موجود")
	# إجمالي المديونية من المبيعات الآجلة - المدفوعات
	from ..models import PaymentMethod
	credit_sales = db.query(func.coalesce(func.sum(Sale.total_amount - Sale.amount_paid), 0)).filter(Sale.customer_id == customer_id, Sale.payment_method == PaymentMethod.debt).scalar() or 0
	payments = db.query(func.coalesce(func.sum(DebtPayment.amount), 0)).filter(DebtPayment.customer_id == customer_id).scalar() or 0
	return {"customer_id": customer_id, "name": c.name, "current_debt": float(Decimal(credit_sales) - Decimal(payments))}