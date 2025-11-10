class_name EnemySpawner
extends Node2D

@export var enemy_scenes : Array[PackedScene]
@export var spawn_interval: Vector2
@export var spawn_offset_y: float = 200
@export var spawn_offset_x: float = 20

@onready var spawn_timer = $SpawnTimer

func _ready() -> void:
	spawn_timer.start(randf_range(spawn_interval.x,spawn_interval.y))
	spawn_timer.timeout.connect(spawn_enemy)

func spawn_enemy() -> void :
	if enemy_scenes.is_empty() :
		return
		
	var camera = get_viewport().get_camera_2d()
	var visible_rect = get_viewport().get_visible_rect()
	
	var x_min = camera.get_screen_center_position().x - (visible_rect.size.x/2) + spawn_offset_x
	var x_max = camera.get_screen_center_position().x + (visible_rect.size.x/2) - spawn_offset_x
	
	var y_min = camera.get_screen_center_position().y - (visible_rect.size.y/2)
	
	var enemy = enemy_scenes.pick_random().instantiate()
	
	var rand_x = randf_range(x_min, x_max)
	
	enemy.global_position.y = y_min - spawn_offset_y
	enemy.global_position.x = rand_x
	
	get_tree().current_scene.add_child(enemy)
	spawn_timer.start(randf_range(spawn_interval.x,spawn_interval.y))
	return 
