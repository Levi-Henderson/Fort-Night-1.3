extends Node2D

const NEW_SCENE_PATH = "res://Scenes/skill_tree.tscn"

@onready var kill_label = $CanvasLayer/Label
@onready var xp_label = $CanvasLayer/Label

func _process(delta):
	
	#kill_label.text = "Killed : " + str(Global.enemies_killed)
	xp_label.text = "XP :" + str(Global.xp)
	
	if Input.is_action_just_pressed("e"):
		get_tree().change_scene_to_file(NEW_SCENE_PATH)
