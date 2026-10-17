extends Area2D

@export var points:int = 5


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.fell_off()
	if body is EnemyBase:
		SignalHub.emit_enemy_killed()
		SignalHub.emit_scored(points)
		body.queue_free()
