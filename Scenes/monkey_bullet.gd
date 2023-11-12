extends CharacterBody2D


var speed = 50

func _process(delta):
	position += Vector2(0, -11).rotated(rotation) * speed * delta
