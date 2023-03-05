extends Label3D


onready var _owner: Spatial = get_owner()


func _process(_delta):
	if(_owner == null):
		return
	
	changeHealth()
	
func changeHealth():
	text = "Health: " + str(PlayerStates.getPlayerHealth())
