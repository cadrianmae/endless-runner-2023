extends Spatial
class_name Player


# Priavte Variables
var xr_camera: Camera
var xr_left_controller: Spatial
var xr_right_controller: Spatial
var kinematic_body: KinematicBody
var collision_shape: CollisionShape

func _enter_tree():
	# Setting up Nodes
	setXRCamera()
	setXRLeftController()
	setXRRightContoller()
	setKinematicBody()
	setCollisionShape()


# Setter Nodes Functions
func setXRCamera():
	xr_camera = $KinematicBody/Pivot/Camera

func setXRLeftController():
	xr_left_controller = $KinematicBody/XRLeftHand

func setXRRightContoller():
	xr_right_controller = $KinematicBody/XRRightHand

func setKinematicBody():
	kinematic_body = $KinematicBody

func setCollisionShape():
	collision_shape = $KinematicBody/CollisionShape

# Getter Functions
func getXRCamera() -> Camera:
	return xr_camera

func getXRLeftController() -> Spatial:
	return xr_left_controller

func getXRRightContoller() -> Spatial:
	return xr_right_controller

func getKinematicBody() -> KinematicBody:
	return kinematic_body

func getCollisionShape() -> CollisionShape:
	return collision_shape
