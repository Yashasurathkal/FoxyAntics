extends Node

const MAIN = preload("res://scenes/main/main.tscn")

const LEVEL_SCENES: Array[PackedScene] = [
	preload("res://scenes/level_base/Level1.tscn"),
	preload("res://scenes/level_base/Level2.tscn"),
	preload("res://scenes/level_base/Level3.tscn"),
]
var _current_level: int = -1

var current_level: int:
	get: return _current_level

func load_next_level() -> void:
	_current_level += 1
	if _current_level >= LEVEL_SCENES.size():
		_current_level = 0
	get_tree().change_scene_to_packed(LEVEL_SCENES[_current_level])

func load_main() -> void:
	_current_level = -1
	ScoreManager.commit_run()
	get_tree().change_scene_to_packed(MAIN)

func reload_current_level() -> void:
	if _current_level < 0 or _current_level >= LEVEL_SCENES.size():
		return
	get_tree().change_scene_to_packed(LEVEL_SCENES[_current_level])
