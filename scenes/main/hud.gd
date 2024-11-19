extends CanvasLayer

##################################################
@onready var score_label = $HBoxContainer/ScoreMarginContainer/ScoreLabel
@onready var best_score_label = $HBoxContainer/BestScoreMarginContainer/BestScoreLabel

##################################################
func _ready() -> void:
	$RestartLabel.visible = false

##################################################
func _process(delta: float) -> void:
	if GameManager.game_start == true:
		$StartLabel.visible = false		
	
	score_label.text = "SCORE: " + str(GameManager.game_score).pad_zeros(5)
	best_score_label.text = "BEST: " + str(GameManager.best_game_score).pad_zeros(5)
	
	if GameManager.game_over == true:
		$RestartLabel.visible = true
	else:
		$RestartLabel.visible = false
