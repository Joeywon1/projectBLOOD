extends TextureButton

@onready var progress_anmation = $Progress
@onready var cooldown = $CooldownTimer
@onready var time_Label = $Time
@onready var hotkey = $Hotkey

@export var cooldown_max_time = 5.0

func _ready():
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

func _on_cooldown_timer_timeout():
	disabled = false
	time_Label.text = ""
	set_process(false)
