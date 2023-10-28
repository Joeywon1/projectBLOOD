extends Node2D

@export var enemy_scene: PackedScene

@export var enemySpawnRate = 0.25

func _ready():
	$SpawnTimer.wait_time = enemySpawnRate

func _spawn_enemy():
	var newEnemy = enemy_scene.instantiate()
	add_sibling(newEnemy)

	screen_limits()

	var rand_x = randf_range(0, screen_limits())
	newEnemy.position.x = rand_x


func screen_limits():
	var width = get_viewport_rect().size.x

	return width

#does this need to be an array? 
#cant it be an ecported rescource with a database for each level info?
#level spawn info can hold the variables
#aand then the levels can use those extended set variables 
#and the level can have spawner as a child thatll control the enemy logic of it
