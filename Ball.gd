extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 250

func _ready():
	randomize_spawn()
	
func randomize_spawn():
	global_position = Vector2(320,180)
	randomize()
	velocity.x = [-1,1][randi()%2]
	velocity.y = [-0.8,0.8][randi()%2]

func _physics_process(delta):
	if not Global.pause:
		var collision = move_and_collide(velocity*speed*delta)
		if collision:
			if collision.collider.is_in_group('Score_left'):
				Global.right_score += 1
				if Global.right_score == 10: Global.right_wins += 1
				scored()
			elif collision.collider.is_in_group('Score_right'):
				Global.left_score += 1
				if Global.left_score == 10: Global.left_wins += 1
				scored()
			else:
				velocity = velocity.bounce(collision.normal)
		
func scored():
	frame_freeze(0.004,1.75)
	randomize_spawn()
		
func frame_freeze(timeScale,duration):
	Engine.time_scale = timeScale
	yield(get_tree().create_timer(duration*timeScale),'timeout')
	Engine.time_scale = 1.0
