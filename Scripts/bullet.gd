extends Area2D
class_name Bullet

@export var speed = 500
var direction : Vector2 = Vector2.RIGHT


func _process(delta: float) -> void:
	#if Input.is_action_pressed("arrowkeyleft"):
		#direction = Vector2.LEFT
	#elif Input.is_action_pressed("arrowkeyup"):
		#direction = Vector2.UP
	#elif Input.is_action_pressed("arrowkeydown"):
		#direction = Vector2.DOWN
	#else:
		#pass
	
	var x_mov = Input.get_action_strength("arrowkeyright") - Input.get_action_strength("arrowkeyleft")
	var y_mov = Input.get_action_strength("arrowkeydown") - Input.get_action_strength("arrowkeyup")
	var mov = Vector2(x_mov, y_mov)
	
	if mov == Vector2.ZERO:
		pass
	else:
		direction = mov.normalized()
		
	#position += transform.x * speed * delta 
	translate(direction * speed * delta)
	
func remove():
	queue_free()
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if await get_tree().create_timer(0.5).timeout and area.is_in_group("player"):
		pass
	else:
		#await get_tree().create_timer(1).timeout
		remove()
