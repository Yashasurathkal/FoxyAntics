extends Node


const EXPLOSION = preload("res://scenes/Explosion/Explosion.tscn")




func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		var ex: Node2D = EXPLOSION.instantiate()
		ex.position = Vector2(
			randf_range(0,300),
			randf_range(500,600)
		)
		add_child(ex)
