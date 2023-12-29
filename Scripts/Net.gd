extends Sprite2D

@onready var balls = $"../../Balls"

func _ready():
	if balls.position.y < -215:
		$".".set_z_index(5)
	elif balls.position.y > -215:
		$".".set_z_index(0)
	else:
		return
		
