extends Node

var left_score = 0
var right_score = 0
var left_wins = 0
var right_wins = 0
var pause = false

func save():
	var save_dict = {
		'left_wins': left_wins,
		'right_wins': right_wins
	}
	return save_dict
	
func save_game():
	var save_game = File.new()
	save_game.open_encrypted_with_pass('user://savegame.save',File.WRITE,'enc')
	save_game.store_line(to_json(save()))

func load_game():
	var save_game = File.new()
	if not save_game.file_exists('user://savegame.save'):
		print('Error 1: no save')
		return
	save_game.open_encrypted_with_pass('user://savegame.save',File.READ,'enc')
	var current_line = parse_json(save_game.get_line())
	left_wins = current_line['left_wins']
	right_wins = current_line['right_wins']
	save_game.close()
