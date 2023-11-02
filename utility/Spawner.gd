extends Node2D

@export var enemyBase: PackedScene

@export var enemyMax = 5
@export var spawnRate = 1.0
@export var enemyPositon: Array[Vector2]

var enemyAmount = 0
var spawnTime = 0.0
var gameTime = 0.0

func _ready():
	randomize()

func _process(delta):
	gameTime += delta
	spawnTime += delta
	if spawnTime >= spawnRate and enemyAmount != enemyMax: 
		spawnTime = 0
		enemyAmount += 1
		var enemy = enemyBase.instantiate()
		enemy.position = enemyPositon.pick_random()
		get_tree().get_root().add_child(enemy)
