extends ARVRController

# Private Variables
var jump_position_area: Area
var wallrun_position_area: Area

func _ready():
	jump_position_area = get_node("JumpPositionArea")
	wallrun_position_area = get_node("WallRunPositionArea")

func leftControllerInput(controller_input: String) -> int:
	# Y
	if(controller_input == "LEFT_Y"):
		return is_button_pressed(1)
	
	# X
	elif(controller_input == "LEFT_X"):
		return is_button_pressed(7)
	
	# Left Trigger
	elif(controller_input == "LEFT_TRIGGER"):
		return is_button_pressed(JOY_VR_TRIGGER)
	
	# Left Grip
	elif(controller_input == "LEFT_GRIP"):
		return is_button_pressed(JOY_VR_GRIP)
	
	# Left Menu
	# Not working cause of steam vr
	elif(controller_input == "LEFT_MENU"):
		return is_button_pressed(JOY_OCULUS_MENU)
	
	return 0

func getJumpPositionArea() -> bool:
	return jump_position_area.jump_position_area

func getWallrunStatus() -> bool:
	return wallrun_position_area.wallrun_status
