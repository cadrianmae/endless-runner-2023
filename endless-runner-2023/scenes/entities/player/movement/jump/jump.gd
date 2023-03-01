extends VRlessMovement
class_name Jump


# Public Variables
export var jump_boost: float = 200
export var jump_force: float = 200

# Private Variables
var jump_status: bool = false
var jump_boost_status: bool = true


func _enter_tree():
	xr_camera = get_parent().getXRCamera()
	xr_left_controller = get_parent().getXRLeftController()
	xr_right_controller = get_parent().getXRRightContoller()
	kinematic_body = get_parent().getKinematicBody()
	collision_shape = get_parent().getCollisionShape()


# Setter Functions
func setJumpStatus(new_jump_status: bool):
	jump_status = new_jump_status

func setJumpBoostStatus(new_jump_boost_status: bool):
	jump_boost_status = new_jump_boost_status


# Getter Functions
func getJumpStatus() -> bool:
	return jump_status

func getJumpBoostStatus() -> bool:
	return jump_boost_status

func getJumpBoost() -> float:
	return jump_boost

func getJumpForce() -> float:
	return jump_force
