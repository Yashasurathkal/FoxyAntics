extends Node


const SCORE_PATH: String = "user://foxyantics.res"
const LEVEL_BONUS: int = 60

signal score_changed

var current_run_score: int = 0
var high_scores: HighScores
var _levels_completed:int = 0

func _ready() -> void:
	load_scores()
	SignalHub.scored.connect(on_scored)


func on_scored(points: int) -> void:
	current_run_score += points
	score_changed.emit()

func on_level_completed() -> void:
	_levels_completed += 1
	on_scored(LEVEL_BONUS * _levels_completed)


func reset_score() -> void:
	current_run_score = 0

func commit_run() -> void:
	if current_run_score <= 0: return
	high_scores.add_score(current_run_score)
	save_scores()
	reset_score()

func load_scores() -> void:
	if FileAccess.file_exists(SCORE_PATH):
		high_scores = load(SCORE_PATH) as HighScores
	if not high_scores:
		high_scores = HighScores.new()


func save_scores() -> void:
	ResourceSaver.save(high_scores, SCORE_PATH)
