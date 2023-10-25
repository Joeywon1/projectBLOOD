extends TextureButton

@onready var progress_anmation = $Progress
@onready var cooldown = $CooldownTimer
@onready var time_Label = $Time
@onready var hotkey = $Hotkey

@export var special_scene: PackedScene
@export var cooldown_max_time = 5.0

var change_key = "":
	set(value):
		change_key = value
		hotkey.text = value
		
		shortcut = Shortcut.new()
		var input_key = InputEventKey.new()
		input_key.keycode = value.unicode_at(0)
		
		shortcut.events = [input_key]

func _ready():
	change_key = "1"
	cooldown.wait_time = cooldown_max_time
	progress_anmation.max_value = cooldown.wait_time
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_Label.text = "%3.1f" % cooldown.time_left
	progress_anmation.value = cooldown.time_left


func _on_pressed():
	cooldown.start()
	disabled = true
	set_process(true)
	
	var newSpecial = special_scene.instantiate()
	var playerData = get_tree().get_first_node_in_group("player")
	
	#changes spawn point depending on what special
	match change_key:
		"1":
			playerData.add_sibling(newSpecial)
			newSpecial.position = playerData.position
		"2":
			playerData.add_child(newSpecial)
		"3":
			pass
	

func _on_cooldown_timer_timeout():
	disabled = false
	time_Label.text = ""
	set_process(false)
