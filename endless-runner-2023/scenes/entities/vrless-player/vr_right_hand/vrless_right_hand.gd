extends Spatial

var wallrun_position_area: Area

func _ready():
	wallrun_position_area = get_node("WallRunPositionArea")

func rightControllerInput(controller_input: String) -> int:
	return 0

func getWallrunStatus() -> bool:
	return wallrun_position_area.wallrun_status
