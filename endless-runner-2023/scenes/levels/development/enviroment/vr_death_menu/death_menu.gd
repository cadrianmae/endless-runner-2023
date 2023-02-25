extends Spatial


# export var mainGameScene : PackedScene
export (String, FILE) var main_game_path
export (String, FILE) var main_menu_path




func _on_PlayButtonPressArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	get_tree().change_scene(main_game_path)

func _on_OptionButtonPressArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	get_tree().change_scene(main_menu_path)
