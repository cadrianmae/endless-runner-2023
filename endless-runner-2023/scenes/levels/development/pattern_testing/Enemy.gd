extends Spatial

onready var firewall: PackedScene = preload("res://scenes/entities/enemies/firewall/enemy_cube.tscn")
onready var timer: Timer = $Timer

func _physics_process(delta):
	if(firewall == null):
		return
	
	spawnFirewall()
	
func spawnFirewall():
	if(!timer.is_stopped()):
		return
	
	var enemy_firewall = firewall.instance()
	timer.start()
	add_child(enemy_firewall)
