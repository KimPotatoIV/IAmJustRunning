extends Node2D

##################################################
var fox_scene: PackedScene
var eagle_scene: PackedScene
var enemy_timer: Timer

##################################################
func _ready() -> void:
	fox_scene = preload("res://scenes/fox/fox.tscn")
	eagle_scene = preload("res://scenes/eagle/eagle.tscn")
	
	enemy_timer = $Timer
	enemy_timer.wait_time = 2
	enemy_timer.connect("timeout"
	, Callable(self, "_on_enemy_timer_timeout"))
	enemy_timer.start()

##################################################
func _on_enemy_timer_timeout() -> void:
	if GameManager.game_start == false or GameManager.game_over == true:
		return
	
	var randi = randi_range(0, 1)
	
	if randi == 0:
		var fox_instance = fox_scene.instantiate()
		add_child(fox_instance)
	else:
		var eagle_instance = eagle_scene.instantiate()
		add_child(eagle_instance)
	
	if GameManager.game_score <= 100:
		enemy_timer.wait_time = randi_range(2, 5)
	elif GameManager.game_score <= 250:
		enemy_timer.wait_time = randi_range(1, 4)
	elif GameManager.game_score <= 400:
		enemy_timer.wait_time = randi_range(1, 3)
	else:
		enemy_timer.wait_time = randi_range(1, 2)
