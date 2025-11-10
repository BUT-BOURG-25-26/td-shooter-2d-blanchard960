class_name Enemy
extends CharacterBody2D

@export var speedOutView: float = 500.0
@export var speed: float = 100.0
@export var pattern: int = 1

func _physics_process(delta: float) -> void:
	if (global_position.y < 100):
		global_position.y += speedOutView * delta;
	else :
		match pattern :
			1 :
				global_position.x += speed * delta
			2 :
				pass
	return 
