extends CharacterBody2D

#player attack
@export var bullet_tscn: PackedScene

#player stats
@export var speed = 300
@export var fireRate = 0.2
@export var fireTime = 0.0
var collected_exp = 0

func _process(delta):
	_move_player()
	#this fixes jittering for some reason
	if _move_player() == get_global_mouse_position():
		print("samk")
	
	if Input.is_action_pressed("shoot"):
		_shoot()

func _move_player():
	var target = get_global_mouse_position() - self.position
	velocity = target.normalized() * speed
	move_and_slide()

func _shoot():
	if _get_time() - fireTime < fireRate:
		return
	fireTime = _get_time()
	var newBullet = bullet_tscn.instantiate()
	newBullet.position = self.position
	self.add_sibling(newBullet)
	var y_offset = Vector2(0,125)
	newBullet.position = self.position - y_offset

func _get_time():
	return Time.get_ticks_msec() / 1000.0


func _on_magnet_zone_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self


func _on_collection_zone_area_entered(area):
	if area.is_in_group("loot"):
		var gem_exp = area.collect()
		Godstats.experience += gem_exp
		#get the collected xp and gives at end of level
#		collected_exp += gem_exp
#		return collected_exp
