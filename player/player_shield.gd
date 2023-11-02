extends Area2D

@export var damage = 2
@export var lifespan = 2.0
@export var maxSize = Vector2(1,1)


func _ready():
	$ShieldLifespan.wait_time = lifespan
	$ShieldLifespan.start()
	
	var tween = create_tween()
	tween.tween_property(self, "scale",maxSize, .2)
	tween.play()

func _process(delta):
	if $ShieldLifespan.time_left != 0.1 and $ShieldLifespan.time_left <= lifespan * .25:
		self.modulate.r -= 0.2
		self.modulate.a -= 0.05

func _on_shield_lifespan_timeout():
	self.queue_free()
