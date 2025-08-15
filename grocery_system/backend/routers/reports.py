from datetime import date, datetime
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from ..db import get_db
from ..models import Sale, DebtPayment, Collector, Product, WeighableProduct
from ..auth import get_current_active_user
from ..utils import EXPORTS_DIR, export_csv

router = APIRouter(prefix="/reports")


@router.get("/daily-summary")
async def daily_summary(on: date | None = None, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	on = on or date.today()
	sales = db.query(Sale).filter(func.date(Sale.timestamp) == on).all()
	total_sales = sum([float(s.total_amount) for s in sales])
	debt_collected = sum([float(p.amount) for p in db.query(DebtPayment).filter(func.date(DebtPayment.paid_at) == on).all()])
	# عمولات المندوبين الإجمالية لليوم
	from ..models import CommissionType
	collector_commissions = 0.0
	payments = db.query(DebtPayment).filter(func.date(DebtPayment.paid_at) == on, DebtPayment.collector_id != None).all()
	collectors = {c.id: c for c in db.query(Collector).all()}
	for p in payments:
		col = collectors.get(p.collector_id)
		if not col:
			continue
		if col.commission_type == CommissionType.percent:
			collector_commissions += float(p.amount) * float(col.commission_value) / 100.0
		else:
			collector_commissions += float(col.commission_value)
	return {
		"date": on.isoformat(),
		"total_sales": total_sales,
		"debt_collected": debt_collected,
		"collector_commissions": collector_commissions,
	}


@router.get("/low-stock")
async def low_stock(db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	products = db.query(Product).filter(Product.is_active == True, Product.stock_quantity <= Product.reorder_level).all()
	weighables = db.query(WeighableProduct).filter(WeighableProduct.is_active == True, WeighableProduct.stock_kg <= WeighableProduct.reorder_level_kg).all()
	return {
		"products": [{"id": p.id, "name": p.name, "stock": float(p.stock_quantity or 0), "reorder_level": float(p.reorder_level or 0)} for p in products],
		"weighables": [{"id": w.id, "name": w.name, "stock": float(w.stock_kg or 0), "reorder_level": float(w.reorder_level_kg or 0)} for w in weighables],
	}


@router.get("/export/daily-csv")
async def export_daily_csv(on: date | None = None, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	on = on or date.today()
	rows = []
	for s in db.query(Sale).filter(func.date(Sale.timestamp) == on).all():
		rows.append({
			"sale_id": s.id,
			"time": s.timestamp.isoformat(),
			"payment_method": s.payment_method,
			"total": float(s.total_amount),
		})
	path = EXPORTS_DIR / f"daily_{on.isoformat()}.csv"
	export_csv(path, rows)
	return {"file": str(path)}