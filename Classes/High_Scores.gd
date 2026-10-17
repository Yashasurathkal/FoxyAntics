class_name HighScores
extends Resource



const MAX_SCORES: int = 4




@export var scores: Array[int] = []



func add_score(score: int) -> void:
	if score <= 0: return
	scores.append(score)
	scores.sort()
	scores.reverse()
	if scores.size() > MAX_SCORES:
		scores.resize(MAX_SCORES)
	
