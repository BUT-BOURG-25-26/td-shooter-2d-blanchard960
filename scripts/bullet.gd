class_name Bullet
extends Area2D

var isPlayerBullet = true
@export var move_speed = 300

func _physics_process(delta: float) -> void:
	var move = Vector2.ZERO
	if isPlayerBullet :
		move.y = -move_speed * delta
	else :
		move.y = move_speed * delta
	global_position += move
