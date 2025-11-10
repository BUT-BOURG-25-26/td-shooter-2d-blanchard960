class_name Player
extends CharacterBody2D

@export var speed:float = 500.0
@export var move_threshold:float = 20.0
@export var health: int = 5
@export var max_health : int = 5
@export var shoot_interval:float = 0.75
@export var bullet_scene : PackedScene
@export var invicibility_time : float = 0.7

@onready var shoot_timer : Timer = $ShootTimer
@onready var invicibility_timer : Timer = $InvicibilityTimer
@onready var animation : AnimationPlayer = $AnimationPlayer

var is_invincible = false

func _ready() -> void:
	shoot_timer.start(shoot_interval)
	shoot_timer.timeout.connect(shoot)
	invicibility_timer.timeout.connect(on_invicibility_end)

func _physics_process(delta: float) -> void:
	
	
	if !GameManager.is_game_running:
		return
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = x_input * speed
	
	if Input.is_action_pressed("click"):
		var mouse_local = get_local_mouse_position()
		if abs(mouse_local.x) > move_threshold :
			velocity.x = speed if mouse_local.x > 0.0 else -speed
		
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if (collision.get_collider() is Enemy):
			take_damage(1)
			collision.get_collider().queue_free()
	return


func take_damage(damage : int)-> void:
	if is_invincible || health <=0:
		return
	is_invincible = true
	health -= damage
	(get_viewport().get_camera_2d() as Camera).start_shake(false)
	if (health <= 0) :
		var timer = get_tree().create_timer(0.5).timeout.connect(GameManager.game_over)
	else :
		animation.play("glow")
		invicibility_timer.start(invicibility_time)
	return 


func shoot(): 
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	get_tree().current_scene.add_child(bullet)
	return

func on_invicibility_end():
	is_invincible = false
	animation.stop()
