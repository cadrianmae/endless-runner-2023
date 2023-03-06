extends ARVRController

var wallrun_position_area: Area

func rightControllerInput(controller_input: String) -> int:
	# Y
	if(controller_input == "RIGHT_B"):
		return is_button_pressed(1)
	
	# X
	elif(controller_input == "RIGHT_A"):
		return is_button_pressed(7)
	
	# Left Trigger
	elif(controller_input == "RIGHT_TRIGGER"):
		return is_button_pressed(JOY_VR_TRIGGER)
	
	# Left Grip
	elif(controller_input == "RIGHT_GRIP"):
		return is_button_pressed(JOY_VR_GRIP)
	
	# Left Menu
	# Not working cause of steam vr
	elif(controller_input == "RIGHT_MENU"):
		return is_button_pressed(JOY_OCULUS_MENU)
	
	return 0


