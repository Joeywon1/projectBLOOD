extends Area2D

var bombLifespan_time = 1.0
var maxsize = Vector2(2,2)

func _ready():
	$BombLifespan.wait_time = bombLifespan_time
	$BombLifespan.start()

func _process(delta):
	_explode()

func _on_bomb_lifespan_timeout():
	self.queue_free()

func _explode():
	var tween = create_tween()
	tween.tween_property(self, "scale",maxsize, bombLifespan_time)
	tween.play()
