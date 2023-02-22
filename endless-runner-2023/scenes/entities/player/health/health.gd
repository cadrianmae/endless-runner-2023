extends Spatial

# Private Variables
export (String, FILE) var death_scene = "res://scenes/levels/development/death_scene/death_scene.tscn"
var _health_counter: int = 3
var _decrement_status: bool = false

func _process(delta):
	playerDeath()

func getLifeStatus() -> bool:
	if(_health_counter > 0):
		return true
	
	return false


func getHealthCounter() -> int:
	return _health_counter


func incrementHealthCouner() -> void:
	_health_counter += 1

func decrementHealthCounter() -> void:
	_health_counter -= 1


func playerDeath():
	if(getLifeStatus()):
		return
	get_tree().change_scene(death_scene)


func _on_BodyCollisionArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(area.name != "EnemyArea"):
		return
	
	_decrement_status = true
	area.freeEnemy()
	decrementHealthCounter()
	_decrement_status = false
