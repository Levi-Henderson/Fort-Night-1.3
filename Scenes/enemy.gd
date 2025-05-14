extends CharacterBody2D


const SPEED = 100
var player : Node2D
var scrap_prefab = preload("res://Scenes/scrap.tscn")

func _ready():
	player = get_tree().get_first_node_in_group("player")
	

func _physics_process(delta: float) -> void:
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * SPEED
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
		Global.xp = 0


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Bullet:
		Global.enemies_killed += 1
		var scrap =  scrap_prefab.instantiate()
		scrap.position = global_position
		get_tree().root.call_deferred("add_child",scrap)
		queue_free()
		area.queue_free()
