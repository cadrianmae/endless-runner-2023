extends Player


onready var vertexs: Array = [
	$PatternGrid/Vertex0/MeshInstance,
	$PatternGrid/Vertex1/MeshInstance,
	$PatternGrid/Vertex2/MeshInstance,
	$PatternGrid/Vertex3/MeshInstance,
	$PatternGrid/Vertex4/MeshInstance,
	$PatternGrid/Vertex5/MeshInstance,
	$PatternGrid/Vertex6/MeshInstance,
	$PatternGrid/Vertex7/MeshInstance,
	$PatternGrid/Vertex8/MeshInstance,
]

onready var marterialOn: Material = preload("res://assets/materials/entities/firewall/vertex_on.tres")
onready var marterialOff: Material = preload("res://assets/materials/entities/firewall/vertex_off.tres")

var player_pattern_array = []

func _enter_tree():
	xr_camera = get_owner().getXRCamera()

func _physics_process(delta):
	if(vertexs == null):
		return
		
	if(PlayerStates.pattern_array == null):
		return
	
	player_pattern_array = PlayerStates.getPlayerPatternArray()
	
	followXRCamera()
	if(PlayerStates.getPlayerVertexCount() == PlayerStates.getPlayerPatternLen()):
		PlayerStates.kill_firewall = true
		PlayerStates.firefall_spawn = false
		visible = false
		return
	
	if(PlayerStates.firefall_spawn == true):
		visible = true
		for i in vertexs:
			i.material_override = marterialOff
			
		vertexs[player_pattern_array[PlayerStates.getPlayerVertexCount()]].material_override = marterialOn
		
	

	

func followXRCamera():
	global_transform.origin.x = xr_camera.global_transform.origin.x
	global_transform.origin.y = xr_camera.global_transform.origin.y


	
func check_vertex(var i):
	if(PlayerStates.firefall_spawn == false):
		return
	
	if (i == player_pattern_array[PlayerStates.vertex_count]):
		PlayerStates.vertex_count = PlayerStates.vertex_count + 1
		

# On Shape Enter
func _on_Vertex0_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	check_vertex(0)
	


func _on_Vertex1_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	check_vertex(1)

func _on_Vertex2_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	check_vertex(2)

func _on_Vertex3_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	check_vertex(3)


func _on_Vertex4_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	check_vertex(4)

func _on_Vertex5_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):

	check_vertex(5)

func _on_Vertex6_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	check_vertex(6)

func _on_Vertex7_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	check_vertex(7)

func _on_Vertex8_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	check_vertex(8)
