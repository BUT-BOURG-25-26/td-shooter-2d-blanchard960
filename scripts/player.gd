class_name Player
extends CharacterBody2D

@export var move_speed:float = 200

var move_inputs: Vector2

func _physics_process(delta: float) -> void:
	read_move_inputs()
	move_inputs *= move_speed * delta
	
	var velocity = Vector2(move_inputs.x,move_inputs.y)
		
	if move_inputs != Vector2.ZERO:
		global_position += velocity
	return

func read_move_inputs():
	move_inputs.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_inputs.y = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	move_inputs = move_inputs.normalized()
	return
