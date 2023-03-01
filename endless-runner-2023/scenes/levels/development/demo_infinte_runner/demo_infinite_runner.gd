extends Spatial


func _enter_tree():
	PlayerStates.resetPlayerHealth()
	PlayerStates.resetPlayerCurrentScore()
	Difficulty.resetGlobalSpeed()
