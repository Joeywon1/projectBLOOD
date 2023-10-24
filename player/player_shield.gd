extends Area2D

var shieldLifespan_time = 2.0
var maxSize = Vector2(1,1)


func _ready():
	$ShieldLifespan.wait_time = shieldLifespan_time
	$ShieldLifespan.start()
	
	var tween = create_tween()
	tween.tween_property(self, "scale",maxSize, .2)
	tween.play()

func _process(delta):
#	var area = self.get_parent().position
#	position = area
	pass

func _on_shield_lifespan_timeout():
	self.queue_free()
