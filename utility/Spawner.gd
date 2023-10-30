extends Node2D

@export var enemyBase: PackedScene

@export var enemyMax = 5
@export var spawnRate = 1.0
@export var enemyPositon: Array

@onready var spawnPoint1 = $SpawnPoints/SpawnPoint1
@onready var spawnPoint2 = $SpawnPoints/SpawnPoint2
@onready var spawnPoint3 = $SpawnPoints/SpawnPoint3
@onready var spawnPoint4 = $SpawnPoints/SpawnPoint4
@onready var spawnPoint5 = $SpawnPoints/SpawnPoint5

var enemyAmount = 0
var spawnTime = 0.0
var gameTime = 0.0



func _process(delta):
	gameTime += delta
	spawnTime += delta
	if spawnTime >= spawnRate and enemyAmount != enemyMax: 
		spawnTime = 0
		enemyAmount += 1
		var enemy = enemyBase.instantiate()
		enemy.set_name("enemy" + str(enemyAmount))
		enemy.position = enemyPositon[0]
		get_tree().get_root().add_child(enemy)
