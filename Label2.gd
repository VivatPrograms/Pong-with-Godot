extends Label

func _process(_delta):
	if Global.left_score == 10:
		show_won('Blue')
	if Global.right_score == 10:
		show_won('Red')
		
func show_won(side):
	Global.save_game()
	visible = true
	get_parent().get_parent().get_parent().get_child(2).visible = false
	var t = '%s won\n blue: %s red: %s\nleft click to restart'
	text = t % [side,Global.left_wins,Global.right_wins]
	Global.pause = true
