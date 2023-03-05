extends Spatial
class_name spawn_area

# Public Variables
export var wall_spawn_rate: int

# Private Variables
# Child nodes
var _wall_spawn_area: Spatial
var _enemy_spawn_area: Spatial
var _floor_spawn_area: Spatial
var _wall_spawn_rate: Timer
var _floor_spawn_rate: Timer
var _enemy_cube_spawn_rate: Timer
var _enemy_l_spawn_rate: Timer
var _enemy_long_boy_spawn_rate: Timer
var _wall_spawn_status: bool


# Wall scene
onready var _wall_scene: PackedScene = preload("res://scenes/levels/development/enviroment/wall/wall.tscn")
onready var _enemy_cube_scene: PackedScene = preload("res://scenes/entities/enemies/cube/enemy_cube.tscn")
onready var _enemy_L_scene: PackedScene = preload("res://scenes/entities/enemies/L/enemy_cube.tscn")
onready var _enemy_long_boy_scene: PackedScene = preload("res://scenes/entities/enemies/long_boy/enemy_cube.tscn")
onready var _floor_scene: PackedScene = preload("res://scenes/levels/development/enviroment/floor/floor.tscn")

# 
var _random_number_generator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_wall_spawn_area = get_node("WallSpawnArea")
	_enemy_spawn_area = get_node("EnemyCubeSpawnArea")
	_floor_spawn_area = get_node("FloorSpawnArea")
	_wall_spawn_rate = get_node("WallSpawnArea/SpawnRate")
	_floor_spawn_rate = get_node("FloorSpawnArea/SpawnRate")
	_enemy_cube_spawn_rate = get_node("EnemyCubeSpawnArea/SpawnRate")
	_enemy_l_spawn_rate = get_node("EnemyLSpawnArea/SpawnRate")
	_enemy_long_boy_spawn_rate = get_node("LongBoySpawnArea/SpawnRate")

func _physics_process(delta):
	spawn()
	matchTimer()

func matchTimer():
	var multiplier = Difficulty.global_speed
	_wall_spawn_rate.wait_time = 20 / multiplier
	_enemy_cube_spawn_rate.wait_time = 2 / multiplier
	_enemy_l_spawn_rate.wait_time = 8 / multiplier
	_enemy_long_boy_spawn_rate.wait_time = 12 / multiplier

func spawn():
	# spawnWall()
	# spawnFloor()
	spawnEnemyCube()
	spawnEnemyL()
	spawnEnemyLongBoy()
	
	

func spawnWall():
	if(!_wall_spawn_rate.is_stopped()):
		spawnFloor()
		return
	
	_wall_spawn_status = false
	var wall = _wall_scene.instance()
	
	wall.scale = Vector3(1, 1, 5 + (0.5 * Difficulty.global_speed))
	
	# Calculate random number to check to spawn wal left or right
	_random_number_generator.randomize()
	if(_random_number_generator.randi_range(0, 1)):
		wall.translate((Vector3(-5, 0 ,0)))
	else:
		wall.translate((Vector3(5, 0 ,0)))
	
	
	_wall_spawn_rate.start()
	_wall_spawn_area.add_child(wall)

func spawnEnemyCube():
	if(!_enemy_cube_spawn_rate.is_stopped()):
		return
		
	var enemy = _enemy_cube_scene.instance()
	
	_random_number_generator.randomize()
	enemy.translate(Vector3(_random_number_generator.randf_range(-4.8, 4.8), 0, 0))
	
	_enemy_cube_spawn_rate.start()
	_enemy_spawn_area.add_child(enemy)

func spawnEnemyL():
	if(!_enemy_l_spawn_rate.is_stopped()):
		return
	var enemy = _enemy_L_scene.instance()
	
	_random_number_generator.randomize()
	enemy.translate(Vector3(_random_number_generator.randf_range(-4.8, 4.8), 0, 0))
	

	_enemy_l_spawn_rate.start()
	_enemy_spawn_area.add_child(enemy)

func spawnEnemyLongBoy():
	if(!_enemy_long_boy_spawn_rate.is_stopped()):
		return
	
	
	var enemy = _enemy_long_boy_scene.instance()
	
	_random_number_generator.randomize()
	enemy.translate(Vector3(0, _random_number_generator.randf_range(0, 5), 0))
	
	_enemy_long_boy_spawn_rate.start()
	_enemy_spawn_area.add_child(enemy)

func spawnFloor():
	if(!_floor_spawn_rate.is_stopped()):
		return
	
	var _floor = _floor_scene.instance()
	
	_floor.scale = Vector3(5, 1, 5)
	
	_floor_spawn_rate.start()
	_floor_spawn_area.add_child(_floor)
