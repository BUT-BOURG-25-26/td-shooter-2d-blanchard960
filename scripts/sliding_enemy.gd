class_name SlidingEnemy

extends  Enemy

@export var sliding_speed_x: float = 300.0

var current_x_direction : float

func _ready() -> void:
	super()
	if randf() >0.5:
		current_x_direction = 1.0
	else :
		current_x_direction = -1.0
	
func move_pattern(delta: float):
	var camera = get_viewport().get_camera_2d()
	var visible_rect = get_viewport().get_visible_rect()
	
	var x_min = camera.get_screen_center_position().x - (visible_rect.size.x/2)
	var x_max = camera.get_screen_center_position().x + (visible_rect.size.x/2)
	
	if (global_position.x <= x_min || global_position.x >= x_max):
		current_x_direction *= -1
		
	velocity.x = sliding_speed_x * current_x_direction
	return 
