extends Spatial






# Called when the node enters the scene tree for the first time.
func _enter_tree():
	PlayerStates.firefall_spawn = true

func _physics_process(delta):
	if (PlayerStates.kill_firewall == true):
		print("I'm dead D:")
		PlayerStates.firefall_spawn = false
		free()
		
		
