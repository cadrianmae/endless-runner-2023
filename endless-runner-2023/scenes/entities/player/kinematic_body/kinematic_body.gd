extends KinematicBody


var _collision_shape: CollisionShape
var _xr_camera: ARVRCamera

# Called when the node enters the scene tree for the first time.
func _ready():
	_collision_shape = get_node("CollisionShape")
	_xr_camera = get_node("XROrigin/XRCamera")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(_collision_shape == null):
		return
	matchHeight()

func matchHeight():
	var height: float = _xr_camera.global_transform.origin.y
	
	if(height > 1.5):
		return
	
	_collision_shape.scale = Vector3(1, (height / 1.4) - 0.2, 1)
