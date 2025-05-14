extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/story.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/control_menu.tscn")
