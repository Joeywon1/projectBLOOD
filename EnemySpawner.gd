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
