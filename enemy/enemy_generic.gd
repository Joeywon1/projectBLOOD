extends Area2D

@export var movementSpeed: float = 200
@export var speedBoost = 1.1
@export var expGiven = 100
@export var health = 3
@export var bulletType: PackedScene

enum enemyState {IDLE, SHOOT, SPEEDING}
var state = enemyState.IDLE

var bloodExp = preload("res://obj/blood_exp.tscn")

var enemyDrop = 300
	
func _process(delta):
	match state:
		enemyState.IDLE:
			position.y += movementSpeed * delta
		enemyState.SHOOT:
			position.y += movementSpeed * speedBoost  * delta
			var bulletShot = bulletType.instantiate()
			var y_offset = Vector2(0, 5)
			bulletShot.position = self.position + y_offset
			add_sibling(bulletShot)
			state = enemyState.IDLE

func _on_area_entered(area):
	if area.is_in_group("attack"):
		enemy_death()

func enemy_death():
	var newExp = bloodExp.instantiate()
	newExp.position = self.position
	newExp.experience = expGiven
	
	get_tree().root.get_node("Main").call_deferred("add_child", newExp)
#	#temp, main will be the level manager 
#	get_tree().root.get_node("Level1").call_deferred("add_child", newExp)
	queue_free()

func _on_player_detection_body_entered(body):
	if body.is_in_group("player"):
		state = enemyState.SHOOT
		
