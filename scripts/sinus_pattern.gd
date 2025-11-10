class_name SinusEnemy

extends  Enemy

@export var frequency: float = 5.0
@export var amplitude : float = 800.0
@export var sinus_speed_y: float = 100.0

var border_sinusoid: Vector2
var start_x: float
var time_elapsed: float =0.0


func _ready() -> void:
	super()
	start_x = global_position.x

func move_pattern(delta: float) -> void:
	time_elapsed += delta
	global_position.x = start_x + sin(time_elapsed * frequency)
	velocity.y = sinus_speed_y

	return 
