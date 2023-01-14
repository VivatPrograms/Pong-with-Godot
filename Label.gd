extends Label

func _process(_delta):
	var t = '%s %s'
	text = t % [Global.left_score,Global.right_score]
