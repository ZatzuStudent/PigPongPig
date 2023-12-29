extends CanvasLayer

class_name UI

@onready var player_points = $MarginContainer/PlayerPoints
@onready var enemy_points = $MarginContainer/EnemyPoints

func _ready():
	player_points.text = "%d" % 0
	enemy_points.text =  "%d" % 0
	
func update_enem_points(points: int):
	enemy_points.text = "%d" % points
	
func update_player_points(points: int):
	player_points.text = "%d" % points
