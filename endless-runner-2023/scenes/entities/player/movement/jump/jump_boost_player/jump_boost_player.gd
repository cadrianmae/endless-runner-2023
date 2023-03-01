extends Jump


# Private Variables
var jump_boost_counter: int = 2
var jump_boost_cooldown: Timer


func _ready():
	jump_force = get_parent().getJumpForce()


func _enter_tree():
	xr_camera = get_parent().getXRCamera()
	xr_right_controller = get_parent().getXRRightContoller()
	kinematic_body = get_parent().getKinematicBody()
	jump_boost_cooldown = get_node("JumpBoostCoolDown")


func jumpBoostPlayer():
	if (kinematic_body.is_on_floor()):
		jump_boost_counter = 2
		jump_boost_cooldown.stop()
		return
	
	elif(!xr_right_controller.rightControllerInput("RIGHT_A")):
		return
	
	elif(jump_boost_counter > 0 and jump_boost_cooldown.is_stopped()):
		get_parent().get_parent().setVelocity( get_parent().get_parent().getVelocity() -  Vector3(-xr_camera.global_rotation.y * movement_speed, -xr_camera.global_rotation.x * 100, jump_boost))
		get_parent().get_parent().setWallrunStatus(false)
		jump_boost_counter -= 1
		jump_boost_cooldown.start()
		return
