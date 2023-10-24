extends Area2D

@export var movementSpeed: float = 200

var enemyDrop = 300
	
func _process(delta):
	position.y += movementSpeed * delta

func _on_area_entered(area):
	if area.is_in_group("attack"):
		queue_free()
