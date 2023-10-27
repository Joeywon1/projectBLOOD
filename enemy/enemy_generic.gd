extends Area2D

@export var movementSpeed: float = 200
@export var expGiven = 100
@export var health = 3

@onready var loot_base = get_tree().get_first_node_in_group("loot")

var bloodExp = preload("res://obj/blood_exp.tscn")

var enemyDrop = 300
	
func _process(delta):
	position.y += movementSpeed * delta

func _on_area_entered(area):
	if area.is_in_group("attack"):
		death()

func death():
	enemy_death()

func enemy_death():
	var newExp = bloodExp.instantiate()
	newExp.position = self.position
	newExp.experience = expGiven
	get_tree().root.get_node("Main").call_deferred("add_child", newExp)
	queue_free()
