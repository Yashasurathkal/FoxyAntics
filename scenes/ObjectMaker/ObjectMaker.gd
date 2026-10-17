extends Node

const SCORE_EFFECT = preload("res://scenes/ScoreEffect/ScoreEffect.tscn")

func _ready() -> void:
	SignalHub.spawn_scene.connect(on_spawn_scene)
	SignalHub.spawn_bullet.connect(on_spawn_bullet)
	SignalHub.spawn_score_effect.connect(on_spawn_score_effect)

func on_spawn_bullet(velocity: Vector2 ,start_pos: Vector2, scene: PackedScene) -> void:
	if !scene: return
	var nb: Bullet = scene.instantiate()
	nb.setup(velocity , start_pos)
	add_child.call_deferred(nb)

func on_spawn_scene(pos: Vector2 , scene: PackedScene) -> void:
	if !scene: return
	var ns = scene.instantiate()
	
	if ns is Node2D:
		ns.global_position = pos
	add_child.call_deferred(ns)


func on_spawn_score_effect(pos: Vector2 , points: int) -> void:
	var nse: ScoreEffect = SCORE_EFFECT.instantiate()
	nse.global_position = pos
	nse.setup(points)
	add_child.call_deferred(nse)
