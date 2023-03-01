extends Spatial


onready var _high_score = $HighScore
onready var _current_score = $CurrentScore

func _ready():
	PlayerStates.setPlayerBestScore()
	_high_score.text = "HIGH SCORE:" + "\n" + str(PlayerStates.getPlayerBestScore())
	_current_score.text = "CURRENT SCORE:" + "\n" + str(PlayerStates.getPlayerCurrentScore())


