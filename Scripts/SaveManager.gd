extends Node

const SAVE_PATH := "user://save_data.json"

var game_data: Dictionary = {
	"splashes": 0
}

func _ready() -> void:
	load_game()

func save_game() -> void:
	# Gather current state from nodes (example data shown)
	# game_data["player_pos_x"] = player.global_position.x
	# game_data["player_pos_y"] = player.global_position.y

	var json_string := JSON.stringify(game_data, "\t")
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	if file:
		file.store_string(json_string)
		file.close()

func load_game() -> bool:
	if not FileAccess.file_exists(SAVE_PATH):
		return false

	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json_text := file.get_as_text()
		file.close()

		var json := JSON.new()
		var error := json.parse(json_text)
		if error == OK:
			var loaded_data = json.get_data()
			if loaded_data is Dictionary:
				game_data = loaded_data
				return true
	return false
