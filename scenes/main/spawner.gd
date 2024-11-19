extends Node2D

##################################################
var fox_scene: PackedScene 
var fox_timer: Timer

##################################################
func _ready() -> void:
	fox_scene = preload("res://scenes/fox/fox.tscn")
	
	fox_timer = $Timer
	fox_timer.wait_time = 2
	fox_timer.connect("timeout", Callable(self, "_on_fox_timer_timeout"))
	fox_timer.start()

##################################################
func _on_fox_timer_timeout() -> void:
	if GameManager.game_start == false or GameManager.game_over == true:
		return
	
	var fox_instance = fox_scene.instantiate()
	add_child(fox_instance)
	
	if GameManager.game_score <= 100:
		fox_timer.wait_time = randi_range(2, 5)
	elif GameManager.game_score <= 250:
		fox_timer.wait_time = randi_range(1, 4)
	elif GameManager.game_score <= 400:
		fox_timer.wait_time = randi_range(1, 3)
	else:
		fox_timer.wait_time = randi_range(1, 2)
