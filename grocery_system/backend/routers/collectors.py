from datetime import date
from fastapi import APIRouter, Depends, HTTPException, Form
from sqlalchemy.orm import Session
from sqlalchemy import func
from ..db import get_db
from ..models import Collector, CommissionType, DebtPayment
from ..auth import get_current_active_user, require_roles, UserRole

router = APIRouter(prefix="/collectors")


@router.get("/")
async def list_collectors(db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	collectors = db.query(Collector).filter(Collector.is_active == True).all()
	return [{"id": c.id, "name": c.name, "company": c.company, "employee_code": c.employee_code, "commission_type": c.commission_type, "commission_value": float(c.commission_value)} for c in collectors]


@router.post("/")
async def create_collector(name: str = Form(...), company: str | None = Form(None), employee_code: str | None = Form(None), commission_type: CommissionType = Form(CommissionType.percent), commission_value: float = Form(0.0), db: Session = Depends(get_db), user = Depends(require_roles(UserRole.admin))):
	c = Collector(name=name, company=company, employee_code=employee_code, commission_type=commission_type, commission_value=commission_value)
	db.add(c)
	db.commit()
	return {"id": c.id}


@router.put("/{collector_id}")
async def update_collector(collector_id: int, name: str | None = Form(None), company: str | None = Form(None), employee_code: str | None = Form(None), commission_type: CommissionType | None = Form(None), commission_value: float | None = Form(None), db: Session = Depends(get_db), user = Depends(require_roles(UserRole.admin))):
	c = db.query(Collector).get(collector_id)
	if not c:
		raise HTTPException(404, detail="غير موجود")
	if name is not None:
		c.name = name
	if company is not None:
		c.company = company
	if employee_code is not None:
		c.employee_code = employee_code
	if commission_type is not None:
		c.commission_type = commission_type
	if commission_value is not None:
		c.commission_value = commission_value
	db.commit()
	return {"status": "ok"}


@router.get("/daily")
async def collectors_daily_summary(on: date | None = None, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	on = on or date.today()
	items = db.query(DebtPayment).filter(func.date(DebtPayment.paid_at) == on).all()
	summary = {}
	for p in items:
		if not p.collector_id:
			continue
		c = summary.setdefault(p.collector_id, {"collector_id": p.collector_id, "total": 0.0, "commission": 0.0})
		c["total"] += float(p.amount)
	# حساب العمولات
	collectors_map = {c.id: c for c in db.query(Collector).all()}
	for cid, s in summary.items():
		col = collectors_map.get(cid)
		if not col:
			continue
		if col.commission_type == CommissionType.percent:
			s["commission"] = s["total"] * float(col.commission_value) / 100.0
		else:
			s["commission"] = float(col.commission_value)
	return list(summary.values())