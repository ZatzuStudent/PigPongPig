extends Node

var speed = 40
var pignumber = 1

func _ready():
	$PigA.visible = true
	$PigB.visible = false
	$PigC.visible = false

func _physics_process(delta):
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
		
