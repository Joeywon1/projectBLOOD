extends Area2D

@export var damage = 20
@export var lifespan = 3.0
@export var maxSize = Vector2(2.5,2.5)

func _ready():
	$BombLifespan.wait_time = lifespan
	$BombLifespan.start()

func _process(delta):
	_explode()
	if $BombLifespan.time_left != 0.1 and $BombLifespan.time_left <= lifespan * .25:
		self.modulate.r += .1

func _on_bomb_lifespan_timeout():
	self.queue_free()

func _explode():
	var tween = create_tween()
	tween.tween_property(self, "scale",maxSize, lifespan)
	tween.play()
