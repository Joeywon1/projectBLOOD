extends Area2D

@export var experience = 1
var speed = -1.0
var fallSpeed = 3
var target = null

func _process(delta):
	self.position.y += fallSpeed

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 2 * delta
		
func collect():
	$CollectionSound.play()
	$Collision.call_deferred("set","disabled", true)
	$Sprite2D.visible = false
	return experience


func _on_collection_sound_finished():
	queue_free()
