class_name Camera
extends Camera2D


@export var shake_strength: float = 8.0
@export var shake_time: float = 0.25

@export var go_shake_curve : Curve
@export var go_shake_time : float = 0.5
@export var go_shake_strength: float = 10.0

var time_elapsed: float = 0
var  is_shaking :bool = false
var  is_go_shake :bool = false

func _process(delta: float) -> void:
	if !is_shaking :
		return
	
	var shake_x 
	var shake_y 
	
	time_elapsed += delta
	
	if is_go_shake :
		var go_shake_value = go_shake_curve.sample(time_elapsed / go_shake_time) * go_shake_strength
		shake_x = randf_range(-go_shake_value,go_shake_value)
		shake_y = randf_range(-go_shake_value,go_shake_value)
	else :
		shake_x = randf_range(-shake_strength,shake_strength)
		shake_y = randf_range(-shake_strength,shake_strength)

	if time_elapsed <= (go_shake_time if is_go_shake else shake_time):
		self.offset = Vector2(shake_x,shake_y)
	else :
		self.offset = Vector2.ZERO
		is_shaking = false

func start_shake(is_gameover : bool):
	time_elapsed = 0.0
	is_shaking= true
	is_go_shake = is_gameover
