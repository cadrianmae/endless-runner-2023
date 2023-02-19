extends Movement


# Public Varables
export var gravity_strenght: float = 600


func gravityPlayer(delta):
	get_parent().setVelocityY(-gravity_strenght * delta )
