extends Node2D

func _ready():
	Global.load_game()

func _process(_delta):
	if Input.is_action_pressed('restart_game') and Global.pause:
		Global.pause = false
		Global.left_score = 0
		Global.right_score = 0
		get_child(3).get_child(0).get_child(1).visible = false
		get_child(2).visible = true
		get_child(0).global_position = Vector2(16,180)
		get_child(1).global_position = Vector2(624,180)
