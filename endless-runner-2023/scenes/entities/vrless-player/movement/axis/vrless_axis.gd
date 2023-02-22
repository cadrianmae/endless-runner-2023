extends VRlessMovement


func _enter_tree():
	kinematic_body = get_parent().getKinematicBody()

func centerPlayerZAxis():
	var speed_mutliplier = 1
	
	if (!kinematic_body.is_on_floor()):
		speed_mutliplier = 0.5
	
	if(kinematic_body.global_transform.origin.z < 0):
		get_parent().setVelocity( get_parent().getVelocity() +  Vector3(0, 0, movement_speed * speed_mutliplier))
	elif(kinematic_body.global_transform.origin.z > 0):
		get_parent().setVelocity( get_parent().getVelocity() -  Vector3(0, 0, movement_speed * speed_mutliplier))
