extends CharacterBody2D
class_name Player


@export var movement_speed = 100
@export var Bullet : PackedScene
@export var hp = 10

var dash = false
var sprint = false




func _process(delta):
	movement()
#	zoom()
	#shoot()
		
func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	velocity = mov.normalized()*movement_speed
	move_and_slide()

	if Input.is_action_pressed("shift"):
		movement_speed = 175.0  
		if dash == true:
			pass
	else: 
		if dash == false:
			movement_speed = 100


	if dash == false:
		if Input.is_action_just_pressed("space"):
			dash = true
			movement_speed = 275
			await get_tree().create_timer(0.2).timeout
			movement_speed = 250
			await get_tree().create_timer(0.05).timeout
			movement_speed = 225
			await get_tree().create_timer(0.05).timeout
			movement_speed = 200
			await get_tree().create_timer(0.05).timeout
			movement_speed = 175
			await get_tree().create_timer(0.05).timeout
			movement_speed = 150
			await get_tree().create_timer(0.05).timeout
			movement_speed = 125
			dash = false

#func zoom():
#	if Input.is_action_just_pressed("shift") and $Camera2D.zoom.x > 4.5:
#		$Camera2D.zoom.x -= 0.001
#		$Camera2D.zoom.y -= 0.001

	if position.y > 900:
		respawn()
	
func respawn():
	if hp < 1:
		get_tree().reload_current_scene()

#damage function

func _on_area_2d_body_entered(body: Area2D) -> void:
	if body.is_in_group("enemy"):
		print("hp negative 1")
		hp - 1


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Scrap:
		#print("suck my nuts")
		Global.xp += 1
		
