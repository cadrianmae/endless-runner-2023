extends Spatial

var pattern_len
var vertex_count = 0

func _enter_tree():
	PlayerStates.pattern_array.clear()
	generate_pattern()

func _physics_process(delta):
	if(vertex_count == pattern_len):
		print("Firewall unlocked")
		PlayerStates.kill_firewall = true
		

func generate_pattern():
	randomize()
	pattern_len = randi() % 8 + 3
	
	
	for i in pattern_len:
		randomize()
		var new_num = randi() % 9
		
		for j in pattern_len:
			while(PlayerStates.pattern_array.has(new_num)):
				randomize()
				new_num = randi() % 9
		
		PlayerStates.pattern_array.append(new_num)
		
	print(PlayerStates.pattern_array)
	
func check_vertex(var i):
	if (i == PlayerStates.patteran_array[vertex_count]):
		vertex_count = vertex_count + 1
		print("correct vertex")
	else:
		print("L bozo")
		
		pass
	
# On Shape Enter
func _on_Vertex0_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	check_vertex(0)
	print("Vertex 0 Entered:" + area.name)
	


func _on_Vertex1_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 1 Entered:" + area.name)
	check_vertex(1)

func _on_Vertex2_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 2 Entered:" + area.name)
	check_vertex(2)

func _on_Vertex3_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 3 Entered:" + area.name)
	check_vertex(3)


func _on_Vertex4_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 4 Entered:" + area.name)
	check_vertex(4)

func _on_Vertex5_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 5 Entered:" + area.name)
	check_vertex(5)

func _on_Vertex6_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 6 Entered:" + area.name)
	check_vertex(6)

func _on_Vertex7_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 7 Entered:" + area.name)
	check_vertex(7)

func _on_Vertex8_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 8 Entered:" + area.name)
	check_vertex(8)

# On Shape Exit
func _on_Vertex0_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 0 Exit:" + area.name)


func _on_Vertex1_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 1 Exit:" + area.name)


func _on_Vertex2_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 2 Exit:" + area.name)


func _on_Vertex3_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 3 Exit:" + area.name)


func _on_Vertex4_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 4 Exit:" + area.name)


func _on_Vertex5_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 5 Exit:" + area.name)


func _on_Vertex6_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 6 Exit:" + area.name)


func _on_Vertex7_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 7 Exit:" + area.name)


func _on_Vertex8_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Vertex 8 Exit:" + area.name)
