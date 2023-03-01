extends VRlessJump


func _enter_tree():
	xr_camera = get_parent().getXRCamera()
	xr_left_controller = get_parent().getXRLeftController()
	jump_force = get_parent().getJumpForce()


func _ready():
	jump_force = get_parent().getJumpForce()


func jumpPlayerPhysical():
	if (xr_camera.transform.origin.y > 1.5):
		if(get_parent().getJumpStatus()):	
			get_parent().get_parent().setVelocityY( get_parent().get_parent().getVelocity().y +  jump_force)
			get_parent().setJumpStatus(false)
		return
	
	if(get_parent().getJumpStatus()):
		return
	
	if(!xr_left_controller.getJumpPositionArea()):
		return

	get_parent().setJumpStatus(true)
