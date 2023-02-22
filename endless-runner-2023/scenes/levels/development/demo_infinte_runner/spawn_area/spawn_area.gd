extends Spatial
class_name spawn_area

# Public Variables
export var wall_spawn_rate: int

# Private Variables
# Child nodes
var _wall_spawn_area: Spatial
var _enemy_spawn_area: Spatial
var _wall_spawn_rate: Timer
var _enemy_spawn_rate: Timer

# Wall scene
onready var _wall_scene: PackedScene = preload("res://scenes/levels/development/enviroment/wall/wall.tscn")
onready var _enemy_cube_scene: PackedScene = preload("res://scenes/entities/enemies/L/enemy_cube.tscn")

# 
var _random_number_generator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_wall_spawn_area = get_node("WallSpawnArea")
	_enemy_spawn_area = get_node("EnemySpawnArea")
	_wall_spawn_rate = get_node("WallSpawnArea/SpawnRate")
	_enemy_spawn_rate = get_node("EnemySpawnArea/SpawnRate")

func _process(delta):
	spawn()

func spawn():
	spawnWall()
	spawnEnemy()

func spawnWall():
	if(!_wall_spawn_rate.is_stopped()):
		return
	
	var wall = _wall_scene.instance()
	
	# Calculate random number to check to spawn wal left or right
	_random_number_generator.randomize()
	if(_random_number_generator.randi_range(0, 1)):
		wall.translate((Vector3(-3, 0 ,0)))
	else:
		wall.translate((Vector3(3, 0 ,0)))
	
	
	_wall_spawn_rate.start()
	_wall_spawn_area.add_child(wall)

func spawnEnemy():
	if(!_enemy_spawn_rate.is_stopped()):
		return
		
	_enemy_spawn_rate.start()
	_enemy_spawn_area.add_child(_enemy_cube_scene.instance())
