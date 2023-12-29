extends CharacterBody2D

var speed = 40
var pignumber = 1

func _ready():
	$PigA.visible = true
	$PigB.visible = false
	$PigC.visible = false

func _physics_process(delta):
	$".".position.y = 290
	
	_pigmovement()
		
	_switch_pigs()
	_pignumbering()
	
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

func _pignumbering():
	if pignumber == 1:
		$PigA.visible = true
		$PigB.visible = false
		$PigC.visible = false
	elif pignumber == 2:
		$PigA.visible = false
		$PigB.visible = true
		$PigC.visible = false
	elif pignumber == 3:
		$PigA.visible = false
		$PigB.visible = false
		$PigC.visible = true
		
func _pigmovement():
	if pignumber == 1:
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("left"):
			velocity.x -= speed
		elif Input.is_action_pressed("right"):
			velocity.x += speed
		else:
			return
		move_and_collide(velocity)
	elif pignumber == 2:
		
		if Input.is_action_pressed("left"):
			position = Vector2(-350, 290)
		if Input.is_action_pressed("right"):
			position = Vector2(350, 290)
		else:
			return
	elif pignumber == 3:
			position = Vector2(0, 290)
			return
