extends CharacterBody2D

##################################################
const JUMP_VELOCITY = -450.0
var sit_skill_node

##################################################
func _ready() -> void:
	sit_skill_node = get_node("../HUD/SitSkill")

##################################################
func _physics_process(delta: float) -> void:
	if GameManager.game_start == false:
		if Input.is_action_just_pressed("ui_accept"):
			GameManager.set_game_start(true)	
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if GameManager.game_over == true:
		$AnimatedSprite2D.play("dead")
		
		if Input.is_action_just_pressed("ui_accept"):
			GameManager.set_game_over(false)
			GameManager.set_score(0)
			
			var nodes = get_tree().get_nodes_in_group("enemy")
			for node in nodes:
				node.queue_free()
		
		return

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("ui_down") and is_on_floor():
		$AnimatedSprite2D.play("sit")
		GameManager.set_sit(true)
		sit_skill_node.use_sit_skill()
	
	else:
		$AnimatedSprite2D.play("run")
		GameManager.set_sit(false)
		
	move_and_slide()
