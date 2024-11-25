extends Area2D

##################################################
func _ready() -> void:
	position = Vector2(664, 289)
	
	self.body_entered.connect(Callable(self, "_on_body_entered"))

##################################################
func _process(delta: float) -> void:
	position.x -= (GameManager.enemy_speed 
	+ GameManager.correction_score) * delta
	
	if position.x <= -50:
		queue_free()

##################################################
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") and GameManager.sit == false:
		GameManager.game_over = true
