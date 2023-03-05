extends KinematicBody

var bullet_speed: float = 5
var velocity: Vector3
var gunRotation: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)


func _physics_process(delta):
	if(gunRotation == null):
		return
	
	move()

func move():
	velocity = Vector3(-gunRotation.y * 10, gunRotation.x * 3, -bullet_speed)
	move_and_slide(velocity)

func setRotation(var playerRotation):
	gunRotation = playerRotation
