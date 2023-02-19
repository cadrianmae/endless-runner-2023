extends Area

# Private Variables
var jump_position_area: bool

func _ready():
	jump_position_area = false

func _on_JumpPositionArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	jump_position_area = true


func _on_JumpPositionArea_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	jump_position_area = false

