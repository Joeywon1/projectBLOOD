extends Area2D

var lifespan = 1.5
var cooldownTime = 1.0 
var bulletSpeed = 20

func _ready():
	$Timer.wait_time = lifespan

func _process(delta):
	self.position.y += bulletSpeed

func _on_timer_timeout():
	queue_free()
