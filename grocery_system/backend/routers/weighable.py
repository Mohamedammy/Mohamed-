from typing import Optional
from decimal import Decimal
from fastapi import APIRouter, Depends, HTTPException, UploadFile, File, Form, Query
from sqlalchemy.orm import Session
from sqlalchemy import or_
from ..db import get_db
from ..models import WeighableProduct, StockMovement, ProductType, StockReason
from ..auth import get_current_active_user, require_roles, UserRole
from pathlib import Path
import shutil
import serial

router = APIRouter(prefix="/weighable")


@router.get("/")
async def list_weighable(q: Optional[str] = Query(default=None), page: int = 1, page_size: int = 50, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	query = db.query(WeighableProduct).filter(WeighableProduct.is_active == True)
	if q:
		like = f"%{q}%"
		query = query.filter(or_(WeighableProduct.name.like(like), WeighableProduct.barcode.like(like)))
	total = query.count()
	items = query.order_by(WeighableProduct.id.desc()).offset((page-1)*page_size).limit(page_size).all()
	return {"total": total, "items": [
		{
			"id": w.id,
			"name": w.name,
			"barcode": w.barcode,
			"price_per_kg_retail": float(w.price_per_kg_retail or 0),
			"price_per_kg_wholesale": float(w.price_per_kg_wholesale or 0),
			"stock_kg": float(w.stock_kg or 0),
			"reorder_level_kg": float(w.reorder_level_kg or 0),
		}
		for w in items
	]}


@router.post("/")
async def create_weighable(
	name: str = Form(...),
	barcode: Optional[str] = Form(None),
	category_id: Optional[int] = Form(None),
	price_per_kg_retail: Decimal = Form(0),
	price_per_kg_wholesale: Decimal = Form(0),
	stock_kg: Decimal = Form(0),
	reorder_level_kg: Decimal = Form(0),
	image: Optional[UploadFile] = File(None),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	if barcode and db.query(WeighableProduct).filter(WeighableProduct.barcode == barcode).first():
		raise HTTPException(400, detail="الباركود مستخدم")
	w = WeighableProduct(
		name=name,
		barcode=barcode,
		category_id=category_id,
		price_per_kg_retail=price_per_kg_retail,
		price_per_kg_wholesale=price_per_kg_wholesale,
		stock_kg=stock_kg,
		reorder_level_kg=reorder_level_kg,
	)
	db.add(w)
	db.flush()
	if image:
		upload_dir = Path("uploads/weighable")
		upload_dir.mkdir(parents=True, exist_ok=True)
		file_path = upload_dir / f"weigh_{w.id}_{image.filename}"
		with file_path.open("wb") as f:
			shutil.copyfileobj(image.file, f)
		w.image_path = str(file_path)
	db.commit()
	return {"id": w.id}


@router.put("/{weigh_id}")
async def update_weighable(
	weigh_id: int,
	name: Optional[str] = Form(None),
	barcode: Optional[str] = Form(None),
	category_id: Optional[int] = Form(None),
	price_per_kg_retail: Optional[Decimal] = Form(None),
	price_per_kg_wholesale: Optional[Decimal] = Form(None),
	stock_kg: Optional[Decimal] = Form(None),
	reorder_level_kg: Optional[Decimal] = Form(None),
	image: Optional[UploadFile] = File(None),
	db: Session = Depends(get_db),
	user = Depends(require_roles(UserRole.admin, UserRole.storekeeper)),
):
	w = db.query(WeighableProduct).get(weigh_id)
	if not w:
		raise HTTPException(404, detail="غير موجود")
	if barcode and barcode != w.barcode:
		if db.query(WeighableProduct).filter(WeighableProduct.barcode == barcode).first():
			raise HTTPException(400, detail="الباركود مستخدم")
	if name is not None:
		w.name = name
	if barcode is not None:
		w.barcode = barcode
	if category_id is not None:
		w.category_id = category_id
	if price_per_kg_retail is not None:
		w.price_per_kg_retail = price_per_kg_retail
	if price_per_kg_wholesale is not None:
		w.price_per_kg_wholesale = price_per_kg_wholesale
	if stock_kg is not None:
		w.stock_kg = stock_kg
	if reorder_level_kg is not None:
		w.reorder_level_kg = reorder_level_kg
	if image:
		upload_dir = Path("uploads/weighable")
		upload_dir.mkdir(parents=True, exist_ok=True)
		file_path = upload_dir / f"weigh_{w.id}_{image.filename}"
		with file_path.open("wb") as f:
			shutil.copyfileobj(image.file, f)
		w.image_path = str(file_path)
	db.commit()
	return {"status": "ok"}


@router.get("/barcode/{barcode}")
async def get_weighable_by_barcode(barcode: str, db: Session = Depends(get_db), user = Depends(get_current_active_user)):
	w = db.query(WeighableProduct).filter(WeighableProduct.barcode == barcode, WeighableProduct.is_active == True).first()
	if not w:
		raise HTTPException(404, detail="غير موجود")
	return {
		"id": w.id,
		"name": w.name,
		"barcode": w.barcode,
		"price_per_kg_retail": float(w.price_per_kg_retail or 0),
		"price_per_kg_wholesale": float(w.price_per_kg_wholesale or 0),
		"stock_kg": float(w.stock_kg or 0),
	}


@router.get("/scale/read")
async def read_from_scale(port: str, baudrate: int = 9600, timeout: float = 1.0):
	try:
		with serial.Serial(port=port, baudrate=baudrate, timeout=timeout) as ser:
			line = ser.readline().decode(errors="ignore").strip()
			# محاولة استخراج رقم من السطر
			import re
			m = re.search(r"([0-9]+(?:\.[0-9]+)?)", line)
			if not m:
				return {"raw": line, "weight": None}
			return {"raw": line, "weight": float(m.group(1))}
	except Exception as e:
		return {"error": str(e)}