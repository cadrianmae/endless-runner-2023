extends Spatial


onready var bullet: PackedScene = preload("res://scenes/entities/player/vr_right_hand/gun/bullet/bit_bullet.tscn")
onready var gunTimer: Timer = $ShootTime
onready var bulletSpawn: Spatial = $BulletSpawnPoint

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	pass

func shoot():
	if(!get_owner().rightControllerInput("RIGHT_TRIGGER")):
		return
	
	if(!gunTimer.is_stopped()):
		return
	
	var rotation = get_owner().global_rotation
	var playerBullet = bullet.instance()
	playerBullet.setRotation(rotation)
	
	gunTimer.start()
	bulletSpawn.add_child(playerBullet)

