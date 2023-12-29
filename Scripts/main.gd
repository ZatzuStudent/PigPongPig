extends Node2D

@onready var balls = $Balls
@onready var ui = $CanvasLayer

var enemy_points = 0
var player_points = 0

func _on_win_body_entered(body):
	print('Win')
	balls.position=Vector2(0,-215)
	balls.speed = 600
	enemy_points += 1
	ui.update_enem_points(enemy_points)
	
func _on_lose_body_entered(body):
	print('Lose')
	balls.position=Vector2(0,-215)
	balls.speed = 600
	player_points += 1
	ui.update_player_points(player_points)
	
