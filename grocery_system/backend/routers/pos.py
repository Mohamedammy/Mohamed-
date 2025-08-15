from decimal import Decimal
from typing import Optional
from fastapi import APIRouter, Depends, HTTPException, Form, Body
from sqlalchemy.orm import Session
from ..db import get_db
from ..models import Product, WeighableProduct, Sale, SaleItem, ProductType, PaymentMethod, StockMovement, StockReason
from ..auth import get_current_active_user, require_roles, UserRole

router = APIRouter(prefix="/pos")


@router.post("/checkout")
async def checkout(
	items: list[dict] = Body(...),
	payment_method: PaymentMethod = Form(...),
	sale_type: str = Form("retail"),
	amount_paid: Decimal = Form(...),
	customer_id: Optional[int] = Form(None),
	notes: Optional[str] = Form(None),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.cashier)),
):
	if not items:
		raise HTTPException(400, detail="لا توجد عناصر")
	# حساب الإجمالي
	total = Decimal(0)
	sale_items: list[SaleItem] = []
	for it in items:
		ptype = it.get("type")
		pid = it.get("id")
		qty = Decimal(str(it.get("quantity")))
		price = Decimal(str(it.get("unit_price")))
		line_total = (qty * price).quantize(Decimal("0.01"))
		total += line_total
		if ptype == "product":
			p = db.query(Product).get(pid)
			if not p:
				raise HTTPException(400, detail="منتج غير موجود")
			if p.stock_quantity < qty:
				raise HTTPException(400, detail=f"المخزون غير كافٍ للمنتج {p.name}")
			si = SaleItem(product_type=ProductType.product, product=p, quantity=qty, unit_price=price, total_price=line_total)
			sale_items.append(si)
			p.stock_quantity = p.stock_quantity - qty
		elif ptype == "weighable":
			w = db.query(WeighableProduct).get(pid)
			if not w:
				raise HTTPException(400, detail="منتج وزن غير موجود")
			if w.stock_kg < qty:
				raise HTTPException(400, detail=f"المخزون غير كافٍ للمنتج {w.name}")
			si = SaleItem(product_type=ProductType.weighable, weighable_product=w, quantity=qty, unit_price=price, total_price=line_total)
			sale_items.append(si)
			w.stock_kg = w.stock_kg - qty
		else:
			raise HTTPException(400, detail="نوع عنصر غير صالح")
	
	if payment_method == PaymentMethod.debt and not customer_id:
		raise HTTPException(400, detail="عميل مطلوب للمديونية")
	
	sale = Sale(
		user_id=user.id,
		customer_id=customer_id,
		payment_method=payment_method,
		sale_type=sale_type,
		total_amount=total,
		amount_paid=amount_paid if payment_method != PaymentMethod.debt else 0,
		change_amount=(amount_paid - total) if payment_method == PaymentMethod.cash and amount_paid >= total else 0,
		notes=notes,
	)
	db.add(sale)
	db.flush()
	for si in sale_items:
		si.sale_id = sale.id
		db.add(si)
		# حركة مخزون
		if si.product_type == ProductType.product:
			mov = StockMovement(product_type=ProductType.product, product_id=si.product_id, change=-si.quantity, reason=StockReason.sale, user_id=user.id)
			db.add(mov)
		else:
			mov = StockMovement(product_type=ProductType.weighable, weighable_product_id=si.weighable_product_id, change=-si.quantity, reason=StockReason.sale, user_id=user.id)
			db.add(mov)
	
	# تحديث مديونية العميل المختارة (مؤشر سريع)
	if payment_method == PaymentMethod.debt and customer_id:
		from ..models import Customer
		c = db.query(Customer).get(customer_id)
		if c:
			c.total_debt = (c.total_debt or 0) + total
	
	db.commit()
	return {"sale_id": sale.id, "total": float(total), "change": float(sale.change_amount)}