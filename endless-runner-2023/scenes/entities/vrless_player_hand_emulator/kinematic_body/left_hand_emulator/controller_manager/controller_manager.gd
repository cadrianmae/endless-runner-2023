extends Spatial

export var speed: float = 0.05

# Called when the node enters the scene tree for the first time.
func _process(delta):
	inputManager()

func inputManager():
	if(Input.is_action_pressed("Up")):
		get_owner().translate(Vector3(0, speed, 0))
	elif(Input.is_action_pressed("Down")):
		get_owner().translate(Vector3(0, -speed, 0))
	elif(Input.is_action_pressed("Left")):
		get_owner().translate(Vector3(-speed, 0, 0))
	elif(Input.is_action_pressed("Right")):
		get_owner().translate(Vector3(speed, 0, 0))
