class_name EnemySpawner
extends Node2D

@export var enemy_scene : PackedScene
@export var spawn_interval = 2
var rng = RandomNumberGenerator.new()

@onready var spawn_timer = $SpawnTimer

func _ready() -> void:
	spawn_timer.start(spawn_interval)

func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	
	var rand_x = rng.randf_range(20, 580)
	enemy.global_position.y = global_position.y
	enemy.global_position.x = rand_x
	get_tree().current_scene.add_child(enemy)
	return 
