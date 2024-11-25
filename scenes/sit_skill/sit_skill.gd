extends TextureProgressBar

var cooldown_time = 3.0
var remaining_time = 0.0
var skill_ready = true

func _ready():
	self.value = 0
	self.max_value = cooldown_time
	set_process(true)

func _process(delta):
	if remaining_time > 0:
		remaining_time -= delta
		self.value = cooldown_time - remaining_time
		if remaining_time <= 0:
			skill_ready = true
			self.value = 0

func use_skill():
	if skill_ready == true:
		remaining_time = cooldown_time
		skill_ready = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		use_skill()
