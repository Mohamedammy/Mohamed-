import os
from pathlib import Path
import shutil
import uvicorn
from fastapi import FastAPI, Request, Depends
from fastapi.staticfiles import StaticFiles
from fastapi.responses import RedirectResponse
from starlette.templating import Jinja2Templates

from backend.db import Base, engine, get_db
from backend.models import User
from backend.auth import router as auth_router, get_current_active_user
from backend.auth import set_secret_from_settings
from backend.routers.products import router as products_router
from backend.routers.weighable import router as weighable_router
from backend.routers.customers import router as customers_router
from backend.routers.debts import router as debts_router
from backend.routers.collectors import router as collectors_router
from backend.routers.pos import router as pos_router
from backend.routers.reports import router as reports_router
from backend.routers.settings import router as settings_router
from backend.routers.stock import router as stock_router
from backend.utils import ensure_directories, seed_initial_data

BASE_DIR = Path(__file__).resolve().parent
APP_DIR = BASE_DIR / "backend"
FRONTEND_DIR = BASE_DIR / "frontend"
DB_DIR = BASE_DIR / "database"
BACKUPS_DIR = DB_DIR / "backups"

app = FastAPI(title="Grocery System", version="1.0.0")

# قوالب الواجهات
TEMPLATES_DIR = FRONTEND_DIR / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))

# الملفات الثابتة
STATIC_DIR = FRONTEND_DIR / "static"
app.mount("/static", StaticFiles(directory=str(STATIC_DIR)), name="static")

# تضمين الموجهات
app.include_router(auth_router, prefix="/api", tags=["auth"])
app.include_router(products_router, prefix="/api", tags=["products"])
app.include_router(weighable_router, prefix="/api", tags=["weighable_products"])
app.include_router(customers_router, prefix="/api", tags=["customers"])
app.include_router(debts_router, prefix="/api", tags=["debts"])
app.include_router(collectors_router, prefix="/api", tags=["collectors"])
app.include_router(pos_router, prefix="/api", tags=["pos"])
app.include_router(reports_router, prefix="/api", tags=["reports"])
app.include_router(settings_router, prefix="/api", tags=["settings"])
app.include_router(stock_router, prefix="/api", tags=["stock"]) 


@app.on_event("startup")
async def startup_event():
	# إنشاء المجلدات المطلوبة ونسخ احتياطي تلقائي لقاعدة البيانات
	ensure_directories()
	Base.metadata.create_all(bind=engine)
	seed_initial_data()
	set_secret_from_settings()
	# نسخ احتياطي عند كل تشغيل
	DB_FILE = DB_DIR / "grocery.db"
	if DB_FILE.exists():
		BACKUPS_DIR.mkdir(parents=True, exist_ok=True)
		backup_path = BACKUPS_DIR / f"backup_{__import__('datetime').datetime.now().strftime('%Y%m%d_%H%M%S')}.sqlite3"
		shutil.copy2(DB_FILE, backup_path)


@app.get("/")
async def root(request: Request):
	return RedirectResponse(url="/login")


@app.get("/login")
async def login_page(request: Request):
	return templates.TemplateResponse("login.html", {"request": request, "title": "تسجيل الدخول"})


@app.get("/pos")
async def pos_page(request: Request, user: User = Depends(get_current_active_user)):
	return templates.TemplateResponse("pos.html", {"request": request, "title": "نقطة البيع", "user": user})


@app.get("/wholesale")
async def wholesale_page(request: Request, user: User = Depends(get_current_active_user)):
	return templates.TemplateResponse("wholesale.html", {"request": request, "title": "البيع بالجملة", "user": user})


@app.get("/weight-pos")
async def weight_pos_page(request: Request, user: User = Depends(get_current_active_user)):
	return templates.TemplateResponse("weight_pos.html", {"request": request, "title": "بيع بالوزن", "user": user})


@app.get("/products")
async def products_page(request: Request, user: User = Depends(get_current_active_user)):
	return templates.TemplateResponse("products.html", {"request": request, "title": "المنتجات", "user": user})


@app.get("/customers")
async def customers_page(request: Request, user: User = Depends(get_current_active_user)):
	return templates.TemplateResponse("customers.html", {"request": request, "title": "العملاء والمديونية", "user": user})


@app.get("/collectors")
async def collectors_page(request: Request, user: User = Depends(get_current_active_user)):
	return templates.TemplateResponse("collectors.html", {"request": request, "title": "المندوبون", "user": user})


@app.get("/reports")
async def reports_page(request: Request, user: User = Depends(get_current_active_user)):
	return templates.TemplateResponse("reports.html", {"request": request, "title": "التقارير", "user": user})


if __name__ == "__main__":
	uvicorn.run("main:app", host="127.0.0.1", port=8069, reload=True)