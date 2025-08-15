from typing import Optional, List
from decimal import Decimal
from fastapi import APIRouter, Depends, HTTPException, UploadFile, File, Form, Query
from sqlalchemy.orm import Session
from sqlalchemy import or_
from ..db import get_db
from ..models import Product, Category, StockMovement, ProductType, StockReason
from ..auth import get_current_active_user, require_roles, UserRole
from ..utils import EXPORTS_DIR
from pathlib import Path
import shutil
import csv

router = APIRouter(prefix="/products")


@router.get("/")
async def list_products(
	q: Optional[str] = Query(default=None),
	page: int = 1,
	page_size: int = 50,
	db: Session = Depends(get_db),
	user = Depends(get_current_active_user),
):
	query = db.query(Product).filter(Product.is_active == True)
	if q:
		like = f"%{q}%"
		query = query.filter(or_(Product.name.like(like), Product.barcode.like(like)))
	total = query.count()
	items = (
		query.order_by(Product.id.desc())
		.offset((page - 1) * page_size)
		.limit(page_size)
		.all()
	)
	return {"total": total, "items": [
		{
			"id": p.id,
			"name": p.name,
			"barcode": p.barcode,
			"unit_price_retail": float(p.unit_price_retail or 0),
			"unit_price_wholesale": float(p.unit_price_wholesale or 0),
			"stock_quantity": float(p.stock_quantity or 0),
			"reorder_level": float(p.reorder_level or 0),
			"image_path": p.image_path,
		}
		for p in items
	]}


@router.post("/")
async def create_product(
	name: str = Form(...),
	barcode: Optional[str] = Form(None),
	category_id: Optional[int] = Form(None),
	unit_price_retail: Decimal = Form(0),
	unit_price_wholesale: Decimal = Form(0),
	stock_quantity: Decimal = Form(0),
	reorder_level: Decimal = Form(0),
	image: Optional[UploadFile] = File(None),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	if barcode and db.query(Product).filter(Product.barcode == barcode).first():
		raise HTTPException(400, detail="الباركود مستخدم")
	p = Product(
		name=name,
		barcode=barcode,
		category_id=category_id,
		unit_price_retail=unit_price_retail,
		unit_price_wholesale=unit_price_wholesale,
		stock_quantity=stock_quantity,
		reorder_level=reorder_level,
	)
	db.add(p)
	db.flush()
	if image:
		upload_dir = Path("uploads/products")
		upload_dir.mkdir(parents=True, exist_ok=True)
		file_path = upload_dir / f"product_{p.id}_{image.filename}"
		with file_path.open("wb") as f:
			shutil.copyfileobj(image.file, f)
		p.image_path = str(file_path)
	db.commit()
	return {"id": p.id}


@router.put("/{product_id}")
async def update_product(
	product_id: int,
	name: Optional[str] = Form(None),
	barcode: Optional[str] = Form(None),
	category_id: Optional[int] = Form(None),
	unit_price_retail: Optional[Decimal] = Form(None),
	unit_price_wholesale: Optional[Decimal] = Form(None),
	stock_quantity: Optional[Decimal] = Form(None),
	reorder_level: Optional[Decimal] = Form(None),
	image: Optional[UploadFile] = File(None),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	p = db.query(Product).get(product_id)
	if not p:
		raise HTTPException(404, detail="غير موجود")
	if barcode and barcode != p.barcode:
		if db.query(Product).filter(Product.barcode == barcode).first():
			raise HTTPException(400, detail="الباركود مستخدم")
	if name is not None:
		p.name = name
	if barcode is not None:
		p.barcode = barcode
	if category_id is not None:
		p.category_id = category_id
	if unit_price_retail is not None:
		p.unit_price_retail = unit_price_retail
	if unit_price_wholesale is not None:
		p.unit_price_wholesale = unit_price_wholesale
	if stock_quantity is not None:
		p.stock_quantity = stock_quantity
	if reorder_level is not None:
		p.reorder_level = reorder_level
	if image:
		upload_dir = Path("uploads/products")
		upload_dir.mkdir(parents=True, exist_ok=True)
		file_path = upload_dir / f"product_{p.id}_{image.filename}"
		with file_path.open("wb") as f:
			shutil.copyfileobj(image.file, f)
		p.image_path = str(file_path)
	db.commit()
	return {"status": "ok"}


@router.delete("/{product_id}")
async def delete_product(
	product_id: int,
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	p = db.query(Product).get(product_id)
	if not p:
		raise HTTPException(404, detail="غير موجود")
	p.is_active = False
	db.commit()
	return {"status": "deleted"}


@router.get("/barcode/{barcode}")
async def get_by_barcode(barcode: str, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	p = db.query(Product).filter(Product.barcode == barcode, Product.is_active == True).first()
	if not p:
		raise HTTPException(404, detail="غير موجود")
	return {
		"id": p.id,
		"name": p.name,
		"barcode": p.barcode,
		"unit_price_retail": float(p.unit_price_retail or 0),
		"unit_price_wholesale": float(p.unit_price_wholesale or 0),
		"stock_quantity": float(p.stock_quantity or 0),
	}


@router.post("/bulk-update-prices")
async def bulk_update_prices(
	category_id: Optional[int] = Form(None),
	percentage: Optional[float] = Form(None),
	flat_amount: Optional[float] = Form(None),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	query = db.query(Product).filter(Product.is_active == True)
	if category_id:
		query = query.filter(Product.category_id == category_id)
	products = query.all()
	for p in products:
		if percentage is not None:
			p.unit_price_wholesale = (Decimal(p.unit_price_wholesale) * (Decimal(1) + Decimal(percentage) / Decimal(100))).quantize(Decimal("0.01"))
			p.unit_price_retail = (Decimal(p.unit_price_retail) * (Decimal(1) + Decimal(percentage) / Decimal(100))).quantize(Decimal("0.01"))
		if flat_amount is not None:
			p.unit_price_wholesale = Decimal(p.unit_price_wholesale) + Decimal(flat_amount)
			p.unit_price_retail = Decimal(p.unit_price_retail) + Decimal(flat_amount)
	db.commit()
	return {"updated": len(products)}


@router.get("/export/csv")
async def export_products_csv(db: Session = Depends(get_db), user = Depends(require_roles(UserRole.admin, UserRole.storekeeper))):
	rows = []
	for p in db.query(Product).filter(Product.is_active == True).all():
		rows.append({
			"id": p.id,
			"name": p.name,
			"barcode": p.barcode or "",
			"category_id": p.category_id or "",
			"unit_price_retail": float(p.unit_price_retail or 0),
			"unit_price_wholesale": float(p.unit_price_wholesale or 0),
			"stock_quantity": float(p.stock_quantity or 0),
			"reorder_level": float(p.reorder_level or 0),
		})
	export_path = EXPORTS_DIR / "products.csv"
	export_path.parent.mkdir(parents=True, exist_ok=True)
	with export_path.open("w", newline="", encoding="utf-8") as f:
		writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()) if rows else [])
		writer.writeheader()
		for r in rows:
			writer.writerow(r)
	return {"file": str(export_path)}


@router.post("/import/csv")
async def import_products_csv(
	file: UploadFile = File(...),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	content = file.file.read().decode("utf-8").splitlines()
	reader = csv.DictReader(content)
	added = 0
	for row in reader:
		name = row.get("name")
		barcode = row.get("barcode") or None
		if not name:
			continue
		existing = db.query(Product).filter(Product.barcode == barcode).first() if barcode else None
		if existing:
			continue
		p = Product(
			name=name,
			barcode=barcode,
			category_id=int(row.get("category_id") or 0) or None,
			unit_price_retail=Decimal(row.get("unit_price_retail") or 0),
			unit_price_wholesale=Decimal(row.get("unit_price_wholesale") or 0),
			stock_quantity=Decimal(row.get("stock_quantity") or 0),
			reorder_level=Decimal(row.get("reorder_level") or 0),
		)
		db.add(p)
		added += 1
	db.commit()
	return {"added": added}