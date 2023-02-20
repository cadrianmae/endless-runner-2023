extends Node2D


export var mainGameScene : PackedScene


func _on_Play_button_up():
	get_tree().change_scene(mainGameScene.resource_path)
