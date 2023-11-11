extends CharacterBody2D

@onready var joey = load('res://Scenes/joey.tscn')

@export var speed = 500

@export var cooldown = 10
@onready var cooldown_number = 0

func _physics_process(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		velocity.x = -speed
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		velocity.x = speed

	if Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
		velocity.y = speed
	elif Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		velocity.y = -speed

		
	if Input.is_action_pressed("fire"):
		if cooldown_number == 0:
			spawn_joey()
			cooldown_number = cooldown
		else:
			cooldown_number -= 1
	move_and_slide()

func spawn_joey():
	var new_joey = joey.instantiate()
	new_joey.global_position = $joey_spawn.global_position
	get_parent().add_child(new_joey)
