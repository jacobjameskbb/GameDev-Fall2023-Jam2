extends CharacterBody2D

@onready var joey = load('res://Scenes/joey.tscn')

@export var speed = 500

@export var cooldown = 10
@onready var cooldown_number = 0

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
	if Input.is_action_pressed("right"):
		position.x += speed * delta
	if Input.is_action_pressed("down"):
		position.y += speed * delta
	if Input.is_action_pressed("up"):
		position.y -= speed * delta
	if Input.is_action_pressed("fire"):
		if cooldown_number == 0:
			spawn_joey()
			cooldown_number = cooldown
		else:
			cooldown_number -= 1


func spawn_joey():
	var new_joey = joey.instantiate()
	new_joey.global_position = $joey_spawn.global_position
	get_parent().add_child(new_joey)
