class_name Player
extends CharacterBody2D

@export var move_speed:float = 500
@export var move_threshold:float = 20

var move_inputs: Vector2

	
func _physics_process(delta: float) -> void:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = x_input * move_speed
	
	if Input.is_action_pressed("click"):
		var mouse_local = get_local_mouse_position()
		if abs(mouse_local.x) > move_threshold :
			velocity.x = move_speed if mouse_local.x > 0.0 else -move_speed
		
	
	move_and_slide()
	
	return
