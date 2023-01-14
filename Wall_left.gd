extends KinematicBody2D

func _ready():
	global_position = Vector2(16,180)

func _physics_process(_delta):
	if not Global.pause:
		var speed = 200
		var move = int(Input.is_action_pressed('left_down'))-int(Input.is_action_pressed('left_up'))	
		var movement = Vector2(0,move * speed)
		move_and_slide(movement)
