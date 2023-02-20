extends Spatial


export (String, FILE) var value


func _on_DeathBoundaryArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(area.name == "BodyCollisionArea"):
		get_tree().change_scene(value)
