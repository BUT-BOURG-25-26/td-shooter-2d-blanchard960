class_name Bullet
extends Area2D

@export var isAllied = true
@export var speed = 500


func _physics_process(delta: float) -> void:
	global_position.y += -speed * delta if isAllied else speed * delta
