extends Spatial


onready var _enemyDeathAnimation: Spatial = get_parent().get_node("EnemyDeathAnimation") 
onready var _owner: KinematicBody = get_owner()

func freeEnemy():
	_enemyDeathAnimation.playDeathAnimation()
	_owner.queue_free()
