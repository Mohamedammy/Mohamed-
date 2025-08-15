from datetime import datetime
from sqlalchemy import (
	Column,
	Integer,
	String,
	Boolean,
	DateTime,
	ForeignKey,
	Float,
	Numeric,
	Text,
	Enum,
)
from sqlalchemy.orm import relationship
from .db import Base
import enum


class UserRole(str, enum.Enum):
	admin = "admin"
	cashier = "cashier"
	storekeeper = "storekeeper"


class CommissionType(str, enum.Enum):
	percent = "percent"
	fixed = "fixed"


class ProductType(str, enum.Enum):
	product = "product"
	weighable = "weighable"


class PaymentMethod(str, enum.Enum):
	cash = "cash"
	card = "card"
	debt = "debt"


class SaleType(str, enum.Enum):
	retail = "retail"
	wholesale = "wholesale"
	weight = "weight"


class StockReason(str, enum.Enum):
	sale = "sale"
	purchase = "purchase"
	adjustment = "adjustment"
	return_in = "return_in"
	return_out = "return_out"


class User(Base):
	__tablename__ = "users"
	id = Column(Integer, primary_key=True, index=True)
	username = Column(String(50), unique=True, nullable=False, index=True)
	full_name = Column(String(100), nullable=True)
	hashed_password = Column(String(255), nullable=False)
	role = Column(Enum(UserRole), nullable=False, default=UserRole.cashier)
	is_active = Column(Boolean, default=True)
	created_at = Column(DateTime, default=datetime.utcnow)
	sales = relationship("Sale", back_populates="user")
	stock_movements = relationship("StockMovement", back_populates="user")


class Category(Base):
	__tablename__ = "categories"
	id = Column(Integer, primary_key=True)
	name = Column(String(100), unique=True, nullable=False, index=True)
	products = relationship("Product", back_populates="category")
	weighable_products = relationship("WeighableProduct", back_populates="category")


class Product(Base):
	__tablename__ = "products"
	id = Column(Integer, primary_key=True)
	name = Column(String(200), nullable=False)
	barcode = Column(String(100), unique=True, index=True)
	category_id = Column(Integer, ForeignKey("categories.id"), nullable=True)
	unit_price_retail = Column(Numeric(12, 2), nullable=False, default=0)
	unit_price_wholesale = Column(Numeric(12, 2), nullable=False, default=0)
	stock_quantity = Column(Numeric(14, 3), nullable=False, default=0)
	reorder_level = Column(Numeric(14, 3), nullable=False, default=0)
	image_path = Column(String(255), nullable=True)
	is_active = Column(Boolean, default=True)
	created_at = Column(DateTime, default=datetime.utcnow)
	category = relationship("Category", back_populates="products")
	sale_items = relationship("SaleItem", back_populates="product")
	stock_movements = relationship("StockMovement", back_populates="product")


class WeighableProduct(Base):
	__tablename__ = "weighable_products"
	id = Column(Integer, primary_key=True)
	name = Column(String(200), nullable=False)
	barcode = Column(String(100), unique=True, index=True)
	category_id = Column(Integer, ForeignKey("categories.id"), nullable=True)
	price_per_kg_retail = Column(Numeric(12, 2), nullable=False, default=0)
	price_per_kg_wholesale = Column(Numeric(12, 2), nullable=False, default=0)
	stock_kg = Column(Numeric(14, 3), nullable=False, default=0)
	reorder_level_kg = Column(Numeric(14, 3), nullable=False, default=0)
	image_path = Column(String(255), nullable=True)
	is_active = Column(Boolean, default=True)
	created_at = Column(DateTime, default=datetime.utcnow)
	category = relationship("Category", back_populates="weighable_products")
	sale_items = relationship("SaleItem", back_populates="weighable_product")
	stock_movements = relationship("StockMovement", back_populates="weighable_product")


class Customer(Base):
	__tablename__ = "customers"
	id = Column(Integer, primary_key=True)
	name = Column(String(200), nullable=False)
	phone = Column(String(50), nullable=True)
	address = Column(String(255), nullable=True)
	total_debt = Column(Numeric(14, 2), nullable=False, default=0)
	created_at = Column(DateTime, default=datetime.utcnow)
	sales = relationship("Sale", back_populates="customer")
	debt_payments = relationship("DebtPayment", back_populates="customer")


class Collector(Base):
	__tablename__ = "collectors"
	id = Column(Integer, primary_key=True)
	name = Column(String(200), nullable=False)
	company = Column(String(200), nullable=True)
	employee_code = Column(String(100), nullable=True)
	commission_type = Column(Enum(CommissionType), nullable=False, default=CommissionType.percent)
	commission_value = Column(Numeric(10, 2), nullable=False, default=0)
	is_active = Column(Boolean, default=True)
	debt_payments = relationship("DebtPayment", back_populates="collector")


class Sale(Base):
	__tablename__ = "sales"
	id = Column(Integer, primary_key=True)
	timestamp = Column(DateTime, default=datetime.utcnow)
	user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
	customer_id = Column(Integer, ForeignKey("customers.id"), nullable=True)
	payment_method = Column(Enum(PaymentMethod), nullable=False)
	sale_type = Column(Enum(SaleType), nullable=False, default=SaleType.retail)
	total_amount = Column(Numeric(14, 2), nullable=False, default=0)
	amount_paid = Column(Numeric(14, 2), nullable=False, default=0)
	change_amount = Column(Numeric(14, 2), nullable=False, default=0)
	notes = Column(Text, nullable=True)
	user = relationship("User", back_populates="sales")
	customer = relationship("Customer", back_populates="sales")
	items = relationship("SaleItem", back_populates="sale")


class SaleItem(Base):
	__tablename__ = "sale_items"
	id = Column(Integer, primary_key=True)
	sale_id = Column(Integer, ForeignKey("sales.id"), nullable=False)
	product_type = Column(Enum(ProductType), nullable=False)
	product_id = Column(Integer, ForeignKey("products.id"), nullable=True)
	weighable_product_id = Column(Integer, ForeignKey("weighable_products.id"), nullable=True)
	quantity = Column(Numeric(14, 3), nullable=False, default=0)
	unit_price = Column(Numeric(12, 2), nullable=False, default=0)
	total_price = Column(Numeric(14, 2), nullable=False, default=0)
	sale = relationship("Sale", back_populates="items")
	product = relationship("Product", back_populates="sale_items")
	weighable_product = relationship("WeighableProduct", back_populates="sale_items")


class DebtPayment(Base):
	__tablename__ = "debt_payments"
	id = Column(Integer, primary_key=True)
	customer_id = Column(Integer, ForeignKey("customers.id"), nullable=False)
	collector_id = Column(Integer, ForeignKey("collectors.id"), nullable=True)
	amount = Column(Numeric(14, 2), nullable=False, default=0)
	paid_at = Column(DateTime, default=datetime.utcnow)
	note = Column(Text, nullable=True)
	sale_id = Column(Integer, ForeignKey("sales.id"), nullable=True)
	customer = relationship("Customer", back_populates="debt_payments")
	collector = relationship("Collector", back_populates="debt_payments")


class StockMovement(Base):
	__tablename__ = "stock_movements"
	id = Column(Integer, primary_key=True)
	product_type = Column(Enum(ProductType), nullable=False)
	product_id = Column(Integer, ForeignKey("products.id"), nullable=True)
	weighable_product_id = Column(Integer, ForeignKey("weighable_products.id"), nullable=True)
	change = Column(Numeric(14, 3), nullable=False)
	reason = Column(Enum(StockReason), nullable=False)
	created_at = Column(DateTime, default=datetime.utcnow)
	user_id = Column(Integer, ForeignKey("users.id"), nullable=True)
	user = relationship("User", back_populates="stock_movements")
	product = relationship("Product", back_populates="stock_movements")
	weighable_product = relationship("WeighableProduct", back_populates="stock_movements")


class SystemSetting(Base):
	__tablename__ = "system_settings"
	id = Column(Integer, primary_key=True)
	key = Column(String(100), unique=True, index=True)
	value = Column(String(1000), nullable=True)