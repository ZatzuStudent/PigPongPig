extends CharacterBody2D

var speed = 8
var ball

@onready var balls = $"../Balls"

func _physics_process(delta):
	move_and_collide(Vector2(get_opponent_direction()*speed,0))
	
func get_opponent_direction():
	if abs (balls.position.x - position.x) > 25:
		if (balls.position.x > position.x): return 1
		else: return -1
	else: return 0
