extends Spatial


var _health_counter: int = 3
var _decrement_status: bool = false


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



func _on_BodyCollisionArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(area.name != "EnemyArea"):
		return
	
	_decrement_status = true
	area.freeEnemy()
	decrementHealthCounter()
	_decrement_status = false
