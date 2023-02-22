extends Spatial


var deathParticle: PackedScene = preload("res://assets/particles/entities/enemies/death_particle/death_particle.tscn")
onready var _current_scene: SceneTree = get_tree()

func playDeathAnimation():
	var _particle: Particles = deathParticle.instance()
	_particle.global_transform = get_owner().global_transform
	_particle.global_rotation = get_owner().global_rotation
	_particle.emitting = true
	_current_scene.current_scene.add_child(_particle)

