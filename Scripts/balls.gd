extends CharacterBody2D

var speed = 600
var boostspeed = 1200
@onready var balls = $"../Balls"
var pignumber = 1

func _ready():
	position = Vector2(0,-190)
	randomize()
	velocity.x = [-0.5, -.3, .3, 0.5].pick_random()
	velocity.y = 1

	
func _physics_process(delta):
	_switch_pigs()
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.get_normal())
		
		if pignumber == 1:
			_pigA_ball_vel_x()
		elif pignumber == 2:
			_pigB_ball_vel_x()
		elif pignumber == 3:
			_pigC_ball_vel_x()
		else:
			return
	
	scale = Vector2((balls.position.y+450)/500, (balls.position.y+450)/500)
	
func _pigA_ball_vel_x():
	if balls.position.x > 0 && balls.position.y > 1:
		velocity.x = -(balls.position.x/1300)
	elif balls.position.x < -1 && balls.position.y > 1:
		velocity.x = abs(balls.position.x/1300)
	elif balls.position.y < 1:
		randomize()
		velocity.x = [-0.5, -.3, .3, 0.5].pick_random()
	else:
		return
		
func _pigB_ball_vel_x():
	if balls.position.x > 0 && balls.position.y > 1:
		velocity.x = -.3
	elif balls.position.x < -1 && balls.position.y > 1:
		velocity.x = .3
	elif balls.position.y < 1:
		randomize()
		velocity.x = [-0.5, -.3, .3, 0.5].pick_random()
	else:
		return
		
func _pigC_ball_vel_x():
	if balls.position.y > 1:
		speed += 200
	else:
		return

func _switch_pigs():
	if Input.is_action_just_pressed("PigSwitchE") && pignumber < 3:
		pignumber +=1
	elif Input.is_action_just_pressed("PigSwitchE") && pignumber == 3:
		pignumber = 1
	elif Input.is_action_just_pressed("PigSwitchQ") && pignumber > 1:
		pignumber -=1
	elif Input.is_action_just_pressed("PigSwitchQ") && pignumber == 1:
		pignumber = 3
	return
