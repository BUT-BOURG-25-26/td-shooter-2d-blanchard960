class_name EnemySpawner
extends Node2D

@export var enemy_scene : PackedScene
@export var spawn_interval = 2

@onready var spawn_timer = $SpawnTimer

func _ready() -> void:
	spawn_timer.start(spawn_interval)

func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.global_position = global_position
	return 
