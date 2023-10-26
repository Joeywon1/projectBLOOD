extends Area2D

@export var flamesLifespanTime = 5.0
#higher is slower
@export var growthSpeed = 1.1
@export var maxLength = Vector2(10,.25)

func _ready():
	$FlamesLifespan.wait_time = flamesLifespanTime
	$FlamesLifespan.start()
	
	_explode()

func _on_flames_lifespan_timeout():
	queue_free()

func _explode():
	var tween = create_tween()
	tween.tween_property(self, "scale",maxLength, flamesLifespanTime * growthSpeed)
	tween.play()
