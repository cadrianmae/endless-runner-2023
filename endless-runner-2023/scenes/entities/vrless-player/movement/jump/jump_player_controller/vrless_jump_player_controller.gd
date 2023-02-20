extends VRlessJump


func _enter_tree():
	kinematic_body = get_parent().getKinematicBody()
	xr_left_controller = get_parent().getXRLeftController()	


func _ready():
	jump_force = get_parent().getJumpForce()


func jumpPlayerController():
	if !kinematic_body.is_on_floor():
		return
		
	if(!Input.is_action_pressed("Jump")):
		return
	
	# Apply Jump
	get_parent().get_parent().setVelocityY( get_parent().get_parent().getVelocity().y + jump_force )
