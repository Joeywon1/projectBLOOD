extends Area2D

@export var bulletSpeed = 5

func _process(delta):
	position.y = self.position.y - 5
	position.y -= bulletSpeed 


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
