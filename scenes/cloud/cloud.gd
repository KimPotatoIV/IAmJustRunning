extends Node2D

var scroll_speed: float = 75

##################################################
func _ready() -> void:
	$Cloud1.position = Vector2(720, get_rand_y())
	$Cloud2.position = Vector2(1120, get_rand_y())

##################################################
func _process(delta: float) -> void:
	$Cloud1.position.x -= scroll_speed * delta
	$Cloud2.position.x -= scroll_speed * delta
	
	move_cloud($Cloud1)
	move_cloud($Cloud2)

##################################################
func move_cloud(cloud: Sprite2D) -> void:
	if cloud.position.x <= -81:
		cloud.position = Vector2(720, get_rand_y())
		
##################################################
func get_rand_y() -> int:
	var rand_y = randi_range(28, 168)
	
	return rand_y
