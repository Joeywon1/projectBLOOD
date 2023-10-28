extends Area2D

@export var bombLifespan_time = 3.0
@export var maxSize = Vector2(2.5,2.5)

func _ready():
	$BombLifespan.wait_time = bombLifespan_time
	$BombLifespan.start()

func _process(delta):
	_explode()

func _on_bomb_lifespan_timeout():
	self.queue_free()

func _explode():
	var tween = create_tween()
	tween.tween_property(self, "scale",maxSize, bombLifespan_time)
	tween.play()
