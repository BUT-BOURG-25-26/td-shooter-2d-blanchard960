class_name Enemy
extends CharacterBody2D

@export var outside_screen_speed: float = 800.0
@export var speed: float = 100.0
@export var offset_outside_screen: float = 100

func _physics_process(delta: float) -> void:
	if (is_in_camera_viewport()):
		velocity.y = 0
		move_pattern()
	else :
		velocity.y = outside_screen_speed
	move_and_slide()


func is_in_camera_viewport() -> bool:
	var camera = get_viewport().get_camera_2d()
	var visible_rect = get_viewport().get_visible_rect()
	
	var x_min = camera.get_screen_center_position().x - (visible_rect.size.x/2)
	var x_max = camera.get_screen_center_position().x + (visible_rect.size.x/2)
	
	var y_min = camera.get_screen_center_position().y - (visible_rect.size.y/2) + offset_outside_screen
	var y_max = camera.get_screen_center_position().y + (visible_rect.size.y/2)
	
	return x_min <= global_position.x && global_position.x <= x_max \
		&& y_min <= global_position.y && global_position.y <= y_max

func move_pattern() -> void :
	pass
