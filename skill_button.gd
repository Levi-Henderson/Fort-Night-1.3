extends TextureButton
class_name SkillNode

@onready var panel = $Panel
@onready var label = $MarginContainer/Label
@onready var line_2d = $Line2D

func _ready():
	if get_parent() is SkillNode:
		line_2d.add_point(global_position + size/2)
		line_2d.add_point(get_parent().global_position + size/2)

var level : int = 0:
	set(value):
		level = value
		label.text = str(level) + "/3"

func _on_pressed() -> void:
	level = min(level+1 , 3)
	panel.show_behind_parent = true
	
	line_2d.default_color = Color(0.037, 0.713, 0.131)
	
	var skills = get_children()
	for skill in skills:
		if skill is SkillNode and level == 3:
			skill.disabled = false
