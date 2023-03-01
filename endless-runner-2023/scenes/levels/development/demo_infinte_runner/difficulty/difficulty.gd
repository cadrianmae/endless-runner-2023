extends Spatial


var _difficulty_timer: Timer



# Called when the node enters the scene tree for the first time.
func _ready():
	_difficulty_timer = get_node("Timer")

func _physics_process(delta):
	if(_difficulty_timer == null):
		return
	
	increaseDifficulty()


func increaseDifficulty():
	if(!_difficulty_timer.is_stopped()):
		return
	
	if(Difficulty.global_speed > 4.0):
		return
	
	_difficulty_timer.start()
	Difficulty.addGlobalSpeed(0.2)
