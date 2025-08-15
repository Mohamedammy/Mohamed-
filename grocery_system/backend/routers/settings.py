from fastapi import APIRouter, Depends, Form
from ..auth import get_current_active_user, require_roles, UserRole
from ..utils import get_setting, set_setting

router = APIRouter(prefix="/settings")


@router.get("/")
async def get_settings(user = Depends(require_roles(UserRole.admin))):
	return {
		"jwt_secret": get_setting("jwt_secret"),
		"printer_type": get_setting("printer_type", "escpos"),
		"printer_device": get_setting("printer_device", ""),
		"scale_port": get_setting("scale_port", ""),
	}


@router.post("/")
async def save_settings(
	jwt_secret: str = Form(None),
	printer_type: str = Form(None),
	printer_device: str = Form(None),
	scale_port: str = Form(None),
	user = Depends(require_roles(UserRole.admin)),
):
	if jwt_secret:
		set_setting("jwt_secret", jwt_secret)
	if printer_type is not None:
		set_setting("printer_type", printer_type)
	if printer_device is not None:
		set_setting("printer_device", printer_device)
	if scale_port is not None:
		set_setting("scale_port", scale_port)
	return {"status": "ok"}