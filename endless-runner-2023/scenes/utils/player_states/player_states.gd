extends Node
class_name player_state

# Public Variable
var pattern_array: Array = []
var kill_firewall: bool= false
var firefall_spawn: bool = false

# Private Variables
var _player_health: int = 3
var _player_current_score: int = 0
var _player_best_score: int = 0

# Getter Functions
func getPlayerHealth() -> int:
	return _player_health

func getPlayerLifeState() -> bool:
	return _player_health > 0

func getPlayerCurrentScore() -> int:
	return _player_current_score

func getPlayerBestScore() -> int:
	return _player_best_score

# Increment Player states
func incrementPlayerHealth() -> void:
	_player_health += 1

func incrementPlayerCurrentScore() -> void:
	_player_current_score += 1

# Decrement Player states
func decrementPlayerHealth() -> void:
	_player_health -= 1

# Setter Functions
func setPlayerBestScore() -> void:
	if (_player_current_score > _player_best_score):
		_player_best_score = _player_current_score

# Rest Functions
func resetPlayerHealth() -> void:
	_player_health = 3

func resetPlayerCurrentScore() -> void:
	_player_current_score = 0
