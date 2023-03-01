extends RigidBody

export var speed: float = 1





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	moveFloor()

func moveFloor():
	# set_axis_velocity(Vector3(0, 0, speed * Difficulty.global_speed))
	# add_force()
	translate(Vector3(0, 0, speed * Difficulty.global_speed))
