extends CharacterBody2D

@onready var point_a = $PointA.global_position
@onready var point_b = $PointB.global_position
@export var speed: float = 300.0

var target: Vector2

func _ready():
	target = point_b 

func _physics_process(delta):
	var direction = (target - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

	if global_position.distance_to(target) < 5.0:
		target = point_a if target == point_b else point_b 
