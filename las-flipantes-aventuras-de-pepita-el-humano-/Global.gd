extends Node

signal message(text: String)

var correct_map := randi_range(1, 5)
var failed_maps: Array[int] = []
var current_map := 0
var key_map := 0
var atril_selected := 0
var habemus_map = false

func bounce_back() -> void:
	if current_map != 0 and not failed_maps.has(current_map):
		failed_maps.append(current_map)
	key_map = 0
	get_tree().reload_current_scene()

func reset_game() -> void:
	correct_map = randi_range(1, 5)
	failed_maps.clear()
	key_map = 0
