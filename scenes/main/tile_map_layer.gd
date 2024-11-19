extends TileMapLayer

var scroll_speed: float = 200
var screen_width: float = 640

##################################################
func _process(delta: float) -> void:
	position.x -= scroll_speed * delta
	
	if position.x <= -screen_width:
		position.x = 0
