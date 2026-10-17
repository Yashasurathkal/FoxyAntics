class_name Coin
extends Area2D


const GROUP_NAME: String = "coin"

@export var points: int = 20
@onready var sound: AudioStreamPlayer = $Sound


func _enter_tree() -> void:
	add_to_group(GROUP_NAME)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		hide()
		sound.play()
		SignalHub.emit_scored(points)
		SignalHub.emit_spawn_score_effect(global_position,points)
		SignalHub.emit_coin_collected()

func _on_sound_finished() -> void:
	queue_free()
