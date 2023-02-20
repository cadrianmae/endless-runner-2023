extends Movement


func _enter_tree():
	xr_camera = get_parent().getXRCamera()
	movement_speed = get_parent().getMovementSpeed()

func velocityPlayer():
	if(get_parent().getWallrunStatus()):
		xr_camera.global_rotation.y = 0
		
	get_parent().setVelocity(Vector3(-xr_camera.global_rotation.y * movement_speed, 0, 0))
