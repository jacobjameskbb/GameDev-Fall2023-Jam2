extends CharacterBody2D

@onready var joey = load("res://joey.tscn")

var speed = 500

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
		var new_joey = joey.instantiate()
		new_joey.position = self.position
		get_parent().add_child(new_joey)
