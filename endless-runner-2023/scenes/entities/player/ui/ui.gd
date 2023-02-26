extends Player


func _enter_tree():
	xr_camera = get_owner().getXRCamera()


func _process(_delta):
	followXRCamera()


func followXRCamera():
	global_transform.origin.x = xr_camera.global_transform.origin.x
	global_transform.origin.y = xr_camera.global_transform.origin.y + 5
	global_transform.origin.z = xr_camera.global_transform.origin.z - 10
	



