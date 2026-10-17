extends Node


signal spawn_score_effect(pos: Vector2 , points: int)
signal spawn_scene(pos: Vector2 , scene: PackedScene)
signal spawn_bullet(velocity: Vector2 ,start_pos: Vector2, scene: PackedScene)
signal coin_collected
signal scored(points: int)
signal level_completed
signal enemy_killed
signal player_hit(_lives: int)

func emit_spawn_score_effect(pos: Vector2 , points: int) -> void:
	spawn_score_effect.emit(pos,points)

func emit_level_completed() -> void:
	level_completed.emit()

func emit_scored(points: int) -> void:
	scored.emit(points)

func emit_player_hit(_lives: int) -> void:
	player_hit.emit(_lives)

func emit_coin_collected() -> void:
	coin_collected.emit()

func emit_enemy_killed() -> void:
	enemy_killed.emit()

func emit_spawn_scene(pos: Vector2 , scene: PackedScene) -> void:
	spawn_scene.emit(pos, scene)

func emit_spawn_bullet(velocity: Vector2 ,start_pos: Vector2, scene: PackedScene) -> void:
	spawn_bullet.emit(velocity,start_pos , scene)
