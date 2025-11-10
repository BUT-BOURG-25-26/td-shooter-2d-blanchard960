class_name Bullet
extends Area2D

@export var is_allied = true
@export var speed = 500


func _physics_process(delta: float) -> void:
	global_position.y += -speed * delta if is_allied else speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy :
		(body as Enemy).take_damage()
		queue_free()
	pass # Replace with function body.
