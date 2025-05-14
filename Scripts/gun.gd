extends Node2D

var bullet_prefab = preload("res://Scenes/bullet.tscn")

var num_bullets = 1
var vector_direction = 0

func _on_timer_timeout() -> void:
	shoot()
	upgrade()
	#direction()

func _process(float) -> void:
	look_at(get_global_mouse_position())


func spawn_bullet(direction : Vector2):
	var bullet = bullet_prefab.instantiate()
	bullet.position = global_position
	bullet.direction = direction
	get_tree().root.add_child(bullet)

func shoot():
	var direction = Vector2.RIGHT
	var step = 2*PI / num_bullets
	for i in range(num_bullets):
		spawn_bullet(direction)
		direction = direction.rotated(step)

#func direction():
	#if vector_direction == 0:
		#Vector2.RIGHT
	#else:
		#Vector2.LEFT
#
	#if Input.is_action_just_pressed("f"):
		#vector_direction = 1
		#
		
func upgrade():
	if Global.xp >= 10 and Global.xp < 20:
		num_bullets = 2
	if Global.xp >= 20 and Global.xp < 40:
		num_bullets = 3
	if Global.xp >= 40 and Global.xp < 60:
		num_bullets = 4
	if Global.xp >= 60 and Global.xp < 80:
		num_bullets = 5
	if Global.xp >= 80 and Global.xp < 100:
		num_bullets = 6
	if Global.xp >= 100 and Global.xp < 120:
		num_bullets = 7
	if Global.xp >= 120 and Global.xp < 140:
		num_bullets = 8
	if Global.xp >= 140 and Global.xp < 160:
		num_bullets = 9
	if Global.xp >= 160 and Global.xp < 10:
		num_bullets = 10
	if Global.xp >= 180 and Global.xp < 200:
		num_bullets = 11
	if Global.xp >= 200 and Global.xp < 220:
		num_bullets = 12
	if Global.xp >= 220 and Global.xp < 240:
		num_bullets = 13
	if Global.xp >= 240 and Global.xp < 260:
		num_bullets = 14
	if Global.xp >= 260 and Global.xp < 280:
		num_bullets = 15
