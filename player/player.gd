extends CharacterBody2D

#player attacks
@export var bullet_tscn: PackedScene
@export var bomb_tscn: PackedScene
@export var shield_tscn: PackedScene

#player stats
@export var speed = 300
@export var fireRate = 0.2
@export var fireTime = 0.0

func _process(delta):
	_move_player()
	#this fixes jittering for some reason
	if _move_player() == get_global_mouse_position():
		print("samk")
	
	if Input.is_action_pressed("shoot"):
		_shoot()
	
	if Input.is_action_just_pressed("special"):
		_special_attack()

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
	
func _special_attack():
		var shieldCooldownTime = 10.0 #might overwrite the bomb timer since they share it
		$AttackCooldown.wait_time = shieldCooldownTime
		if $AttackCooldown.time_left > 0.0:
			return
		else:
			var newShield = shield_tscn.instantiate()
			self.add_child(newShield)
			$AttackCooldown.start()

func _get_time():
	return Time.get_ticks_msec() / 1000.0
