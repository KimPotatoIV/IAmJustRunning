extends Node

##################################################
var game_start: bool = false
var game_over: bool = false
var game_score: int = 0
var best_game_score: int = 0
var correction_score: float = 0
var enemy_speed: float = 150
var sit: bool = false

##################################################
func  _ready() -> void:
	load_score()

##################################################
func _process(delta: float) -> void:
	correction_score = game_score / 5

##################################################
func set_score(value: int) -> void:
	if value == 0:
		game_score = 0
		correction_score = 0
		
	game_score += value
	save_score()

##################################################
func set_game_start(value: bool) -> void:
	game_start = value

##################################################
func set_game_over(value: bool) -> void:
	game_over = value

##################################################
func save_score() -> void:
	if best_game_score > game_score:
		return
		
	best_game_score = game_score
	
	var saved_file = ConfigFile.new()
	saved_file.set_value("game", "score", best_game_score)
	saved_file.save("user://score.cfg")

##################################################
func load_score() -> void:
	var loaded_file = ConfigFile.new()
	loaded_file.load("user://score.cfg")
	
	var score_data = {}
	
	for score in loaded_file.get_sections():
		var player_score = loaded_file.get_value(score, "score")
		score_data[score] = player_score
	
	for score in score_data:
		best_game_score = score_data[score]

##################################################
func set_sit(value: bool) -> void:
	sit = value
