extends EntityMovement


# Public Variables
export var speed: float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func movementForward():
	get_owner().move_and_slide( Vector3(0, 0, speed * Difficulty.global_speed) )
