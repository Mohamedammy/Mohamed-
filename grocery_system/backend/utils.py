from pathlib import Path
from typing import Optional
from decimal import Decimal
from datetime import datetime
import json
import csv
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from sqlalchemy.orm import Session
from .db import DB_DIR, SessionLocal
from .models import User, UserRole, Category, Product, WeighableProduct, SystemSetting
from .auth import get_password_hash

BASE_DIR = Path(__file__).resolve().parents[1]
UPLOADS_DIR = BASE_DIR / "uploads"
EXPORTS_DIR = BASE_DIR / "exports"
RECEIPTS_DIR = BASE_DIR / "receipts"
LOGS_DIR = BASE_DIR / "logs"
FRONTEND_STATIC_DIR = BASE_DIR / "frontend" / "static"


def ensure_directories():
	for d in [UPLOADS_DIR, EXPORTS_DIR, RECEIPTS_DIR, LOGS_DIR, DB_DIR, FRONTEND_STATIC_DIR]:
		d.mkdir(parents=True, exist_ok=True)


def set_setting(key: str, value: str):
	db: Session = SessionLocal()
	try:
		setting = db.query(SystemSetting).filter(SystemSetting.key == key).first()
		if setting:
			setting.value = value
		else:
			setting = SystemSetting(key=key, value=value)
			db.add(setting)
		db.commit()
	finally:
		db.close()


def get_setting(key: str, default: Optional[str] = None) -> Optional[str]:
	db: Session = SessionLocal()
	try:
		setting = db.query(SystemSetting).filter(SystemSetting.key == key).first()
		return setting.value if setting else default
	finally:
		db.close()


def seed_initial_data():
	"""إنشاء مستخدمين افتراضيين وبيانات تجريبية."""
	db: Session = SessionLocal()
	try:
		# مفتاح JWT افتراضي إن لم يوجد
		if not get_setting("jwt_secret"):
			set_setting("jwt_secret", "super_secret_change_me")
		# مستخدمين افتراضيين
		if not db.query(User).filter(User.username == "admin").first():
			admin = User(
				username="admin",
				full_name="مدير النظام",
				hashed_password=get_password_hash("admin123"),
				role=UserRole.admin,
				is_active=True,
			)
			db.add(admin)
		if not db.query(User).filter(User.username == "cashier").first():
			cashier = User(
				username="cashier",
				full_name="كاشير",
				hashed_password=get_password_hash("cashier123"),
				role=UserRole.cashier,
				is_active=True,
			)
			db.add(cashier)
		# فئات وعينات منتجات
		if db.query(Category).count() == 0:
			cat_food = Category(name="مواد غذائية")
			cat_weight = Category(name="خضار وفواكه")
			db.add_all([cat_food, cat_weight])
			db.flush()
			p1 = Product(name="سكر 1كغ", barcode="1001", category=cat_food, unit_price_retail=3.50, unit_price_wholesale=3.00, stock_quantity=100)
			p2 = Product(name="أرز 5كغ", barcode="1002", category=cat_food, unit_price_retail=25.00, unit_price_wholesale=22.00, stock_quantity=50)
			w1 = WeighableProduct(name="تفاح محلي", barcode="2001", category=cat_weight, price_per_kg_retail=8.00, price_per_kg_wholesale=7.00, stock_kg=120)
			db.add_all([p1, p2, w1])
		
		db.commit()
	finally:
		db.close()


# تحويل وحدات الوزن
WEIGHT_UNIT_TO_KG = {
	"g": Decimal("0.001"),
	"kg": Decimal("1"),
	"ton": Decimal("1000"),
}


def to_kilograms(amount: Decimal, unit: str) -> Decimal:
	unit = unit.lower()
	factor = WEIGHT_UNIT_TO_KG.get(unit)
	if not factor:
		raise ValueError("وحدة وزن غير مدعومة")
	return (amount * factor).quantize(Decimal("0.001"))


def export_csv(file_path: Path, rows: list[dict]):
	with file_path.open("w", newline="", encoding="utf-8") as f:
		writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()) if rows else [])
		writer.writeheader()
		for r in rows:
			writer.writerow(r)


def generate_simple_pdf(file_path: Path, title: str, lines: list[str]):
	c = canvas.Canvas(str(file_path), pagesize=A4)
	w, h = A4
	c.setFont("Helvetica", 12)
	c.drawString(40, h - 40, title)
	y = h - 80
	for line in lines:
		c.drawString(40, y, line)
		y -= 18
		if y < 40:
			c.showPage()
			c.setFont("Helvetica", 12)
			y = h - 40
	c.showPage()
	c.save()