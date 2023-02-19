extends Spatial

# Private Variables
var jump_position_area: Area
var wallrun_position_area: Area

func _ready():
	jump_position_area = get_node("JumpPositionArea")
	wallrun_position_area = get_node("WallRunPositionArea")

func leftControllerInput(controller_input: String) -> int:
	return 0

func getJumpPositionArea() -> bool:
	return jump_position_area.jump_position_area

func getWallrunStatus() -> bool:
	return wallrun_position_area.wallrun_status
