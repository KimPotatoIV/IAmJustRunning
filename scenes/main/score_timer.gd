extends Timer

##################################################
func _ready() -> void:
	self.wait_time = 0.1
	self.timeout.connect(Callable(self, "_on_score_timer_timeout"))
	self.start()

##################################################
func _on_score_timer_timeout() -> void:
	if GameManager.game_start == false or GameManager.game_over:
		return
		
	GameManager.set_score(1)
