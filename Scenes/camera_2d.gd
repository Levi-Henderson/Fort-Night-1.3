extends Camera2D


func zoom():
	if Input.is_action_just_pressed("shift") and $Camera2D.zoom.x > 4.5:
		set_zoom(get_zoom() - Vector2(0.25, 0.25))
	if Input.is_action_just_released("shift"): 
		set_zoom(get_zoom() + Vector2(0.25, 0.25))
