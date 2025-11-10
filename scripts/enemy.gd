class_name Enemy
extends CharacterBody2D

@export var outside_screen_speed: float = 800.0
@export var speed: float = 100.0
@export var offset_outside_screen: float = 100
@export var shoot_interval:float = 0.75
@export var bullet_scene : PackedScene
@export var has_entered_screen: bool = false


@onready var shoot_timer : Timer = $ShootTimer

func _ready() -> void:
	shoot_timer.timeout.connect(shoot)


func _physics_process(delta: float) -> void:
	if (is_in_camera_viewport() || has_entered_screen):
		if !has_entered_screen:
			has_entered_screen = true
			shoot_timer.start(shoot_interval)
		velocity.y = 0.0
		move_pattern()
	elif !has_entered_screen :
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

func shoot(): 
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	get_tree().current_scene.add_child(bullet)
	return

func take_damage()-> void :
	queue_free()
	
