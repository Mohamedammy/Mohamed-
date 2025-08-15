from datetime import datetime, timedelta
from typing import Optional
from fastapi import APIRouter, Depends, HTTPException, status, Response, Request
from fastapi.security import OAuth2PasswordRequestForm
from jose import JWTError, jwt
from passlib.context import CryptContext
from sqlalchemy.orm import Session

from .db import get_db
from .models import User, UserRole

router = APIRouter()

# إعداد تشفير كلمات المرور
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# مفاتيح JWT
SECRET_KEY = "change_me_secret_key"  # سيتم استبدالها من الإعدادات عند الإقلاع
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 12 * 60


def verify_password(plain_password: str, hashed_password: str) -> bool:
	return pwd_context.verify(plain_password, hashed_password)


def get_password_hash(password: str) -> str:
	return pwd_context.hash(password)


def create_access_token(data: dict, expires_delta: Optional[timedelta] = None) -> str:
	to_encode = data.copy()
	expire = datetime.utcnow() + (expires_delta or timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
	to_encode.update({"exp": expire})
	token = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
	return token


async def get_current_user(request: Request, db: Session = Depends(get_db)) -> User:
	token = request.cookies.get("access_token")
	if not token:
		raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="غير مصرح")
	try:
		payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
		username: str = payload.get("sub")
		if username is None:
			raise HTTPException(status_code=401, detail="رمز غير صالح")
	except JWTError:
		raise HTTPException(status_code=401, detail="رمز غير صالح")
	user = db.query(User).filter(User.username == username).first()
	if user is None or not user.is_active:
		raise HTTPException(status_code=401, detail="مستخدم غير موجود أو غير نشط")
	return user


async def get_current_active_user(user: User = Depends(get_current_user)) -> User:
	return user


def require_roles(*roles: UserRole):
	def _dependency(user: User = Depends(get_current_active_user)):
		if user.role not in roles:
			raise HTTPException(status_code=403, detail="لا تملك صلاحية")
		return user
	return _dependency


@router.post("/login")
async def login(response: Response, form_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
	user = db.query(User).filter(User.username == form_data.username).first()
	if not user or not verify_password(form_data.password, user.hashed_password):
		raise HTTPException(status_code=400, detail="بيانات الدخول غير صحيحة")
	token = create_access_token({"sub": user.username})
	# وضع التوكن في كوكي آمن
	response.set_cookie(
		key="access_token",
		value=token,
		http_only=True,
		samesite="lax",
		secure=False,
		max_age=ACCESS_TOKEN_EXPIRE_MINUTES * 60,
	)
	return {"message": "تم تسجيل الدخول", "role": user.role}


@router.post("/logout")
async def logout(response: Response):
	response.delete_cookie("access_token")
	return {"message": "تم تسجيل الخروج"}


# دوال مساعدة لاستخدامها في التهيئة الأولية
from .utils import get_setting


def set_secret_from_settings():
	global SECRET_KEY
	val = get_setting("jwt_secret")
	if val:
		SECRET_KEY = val