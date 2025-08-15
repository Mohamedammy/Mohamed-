from decimal import Decimal
from fastapi import APIRouter, Depends, Form
from sqlalchemy.orm import Session
from ..db import get_db
from ..models import Product, WeighableProduct, StockMovement, StockReason, ProductType
from ..auth import require_roles, UserRole

router = APIRouter(prefix="/stock")


@router.post("/adjust")
async def adjust_stock(
	product_type: ProductType = Form(...),
	item_id: int = Form(...),
	change: Decimal = Form(...),
	reason: StockReason = Form(StockReason.adjustment),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	if product_type == ProductType.product:
		p = db.query(Product).get(item_id)
		p.stock_quantity = (p.stock_quantity or 0) + change
		mov = StockMovement(product_type=product_type, product_id=item_id, change=change, reason=reason, user_id=user.id)
		db.add(mov)
	elif product_type == ProductType.weighable:
		w = db.query(WeighableProduct).get(item_id)
		w.stock_kg = (w.stock_kg or 0) + change
		mov = StockMovement(product_type=product_type, weighable_product_id=item_id, change=change, reason=reason, user_id=user.id)
		db.add(mov)
	db.commit()
	return {"status": "ok"}


@router.get("/movements")
async def list_movements(db: Session = Depends(get_db), user = Depends(require_roles(UserRole.admin, UserRole.storekeeper))):
	items = db.query(StockMovement).order_by(StockMovement.created_at.desc()).limit(500).all()
	return [{
		"id": m.id,
		"type": m.product_type,
		"product_id": m.product_id or m.weighable_product_id,
		"change": float(m.change),
		"reason": m.reason,
		"created_at": m.created_at.isoformat(),
	} for m in items]