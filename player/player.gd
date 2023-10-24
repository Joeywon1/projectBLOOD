extends CharacterBody2D

#player attacks
@export var bullet_tscn: PackedScene
@export var bomb_tscn: PackedScene

#player stats
@export var speed = 300
@export var fireRate = 1.0
@export var fireTime = 0.0

func _process(delta):
	_move_player()
	#this fixes jittering for some reason
	if _move_player() == get_global_mouse_position():
		print("samk")
	
	if Input.is_action_just_pressed("shoot"):
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
	fireRate = _get_time()
	var newBullet = bullet_tscn.instantiate()
	newBullet.position = self.position
	self.add_sibling(newBullet)
	var y_offset = Vector2(0,125)
	newBullet.position = self.position - y_offset
	
func _special_attack():
		var bombCooldownTime = 5.0
		$AttackCooldown.wait_time = bombCooldownTime
		if $AttackCooldown.time_left > 0.0:
			return
		else:
			fireRate = _get_time()
			var newBomb = bomb_tscn.instantiate()
			newBomb.position = self.position
			self.add_sibling(newBomb)
		$AttackCooldown.start()

func _get_time():
	return Time.get_ticks_msec() / 1000.0
