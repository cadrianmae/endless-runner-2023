extends Spatial

# Private Variables
var velocity: Vector3


# Nodes
onready var node_forward: Spatial = $Forward


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector3.ZERO


func _physics_process(delta):
	if(node_forward == null):
		return
		
	freeEnemy()
	node_forward.movementForward()
	


# Setter Functions
func setVelocity(new_velocity: Vector3):
	velocity = new_velocity

func setVelocityX(new_velocity_x: float):
	velocity.x = new_velocity_x

func setVelocityY(new_velocity_y: float):
	velocity.y = new_velocity_y

func setVelocityZ(new_velocity_z: float):
	velocity.z = new_velocity_z

 
# Getter Funcitons
func getVelocity() -> Vector3:
	return velocity

func freeEnemy():
	if(get_owner().global_transform.origin.z > 5):
		PlayerStates.incrementPlayerCurrentScore()
		get_owner().queue_free()

