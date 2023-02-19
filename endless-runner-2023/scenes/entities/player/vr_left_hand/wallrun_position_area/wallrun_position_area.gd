extends Area


export var wallrun_status: bool = false


func _on_WallRunPositionArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(area.name == "WallRunningArea"):
		wallrun_status = true


func _on_WallRunPositionArea_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if(area.name == "WallRunningArea"):
		wallrun_status = false
