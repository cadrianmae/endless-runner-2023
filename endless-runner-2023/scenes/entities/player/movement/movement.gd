extends Player
class_name Movement

# Public Variables
var movement_speed: float = 10


# Private Variables
var velocity: Vector3
var wallrun_status: bool = false


# Nodes
onready var node_velocity: Spatial = $Velocity
onready var node_gravity: Spatial = $Gravity
onready var node_wallrun: Spatial = $Wallrun
onready var node_axis: Spatial = $Axis
onready var node_jump_player_controller: Spatial = $Jump/JumpPlayerController
onready var node_jump_player_physical: Spatial = $Jump/JumpPlayerPhysical
onready var node_jump_player_boost: Spatial = $Jump/JumpBoostPlayer


func _enter_tree():
	xr_camera = get_parent().getXRCamera()
	xr_left_controller = get_parent().getXRLeftController()
	xr_right_controller = get_parent().getXRRightContoller()
	kinematic_body = get_parent().getKinematicBody()
	collision_shape = get_parent().getCollisionShape()
	setVelocity(Vector3.ZERO)


func _physics_process(delta):
	movePlayer(delta)


func movePlayer(delta):
	if (node_velocity == null):
		return
	
	node_velocity.velocityPlayer()
	node_gravity.gravityPlayer(delta)
	node_wallrun.wallrunPlayer()
	node_axis.centerPlayerZAxis()
	node_jump_player_controller.jumpPlayerController()
	node_jump_player_physical.jumpPlayerPhysical()
	

	# Apply Velcotiy To player body
	kinematic_body.move_and_slide(velocity, Vector3.UP)


# Setter Velocity Values
func setVelocity(new_velocity: Vector3):
	velocity = new_velocity

func setVelocityX(new_velocity_x: float):
	velocity.x = new_velocity_x

func setVelocityY(new_velocity_y: float):
	velocity.y = new_velocity_y

func setVelocityZ(new_velocity_z: float):
	velocity.z = new_velocity_z


func setWallrunStatus(new_wallrun_status: bool):
	wallrun_status = new_wallrun_status


# Getter Functions
func getMovementSpeed() -> float:
	return movement_speed

func getVelocity() -> Vector3:
	return velocity


func getWallrunStatus() -> bool:
	return wallrun_status

