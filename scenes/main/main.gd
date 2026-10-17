extends Control

const HIGH_SCORE_LABEL = preload("res://Resources/HighScoreLabel.tres")
@onready var score_grid: GridContainer = $MarginContainer/ScoreGrid

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		GameManager.load_next_level()

func _ready() -> void:
	get_tree().paused = false
	add_high_scores()

func add_high_scores() -> void:
	for i in range(ScoreManager.high_scores.scores.size()):
		var lbl: Label = Label.new()
		lbl.text = ("%02d.  %05d" % [
			i+1, ScoreManager.high_scores.scores[i]
		])
		lbl.label_settings = HIGH_SCORE_LABEL
		score_grid.add_child(lbl)
