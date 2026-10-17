extends Area2D
@export var points: int = 10
@onready var anim: AnimatedSprite2D = $Anim
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	anim.animation = (anim.sprite_frames.get_animation_names() as Array[String]).pick_random()
	anim.play()

func _on_body_entered(_body: Node2D) -> void:
	hide()
	SignalHub.emit_scored(points)
	SignalHub.emit_spawn_score_effect(global_position,points)
	audio_stream_player.play()


func _on_audio_stream_player_finished() -> void:
	queue_free()


func _on_collect_timer_timeout() -> void:
	monitoring = true
