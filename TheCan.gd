extends Node2D

@onready var projectile = preload("res://soup_projectile.tscn")

var health = 100

func _on_area_2d_body_entered(body):
	if body.is_in_group('player_bullet'):
		health -= 1

func _on_area_2d_2_body_entered(body):
	if body.is_in_group('player'):
		_wait_for_fire_signal()

func _fire():
	var new_projectile = projectile
	new_projectile.position = position
	for body in $Area2D2.get_overlapping_bodies():
		if body.is_in_group('player'):
			new_projectile.angle_to((new_projectile.position - body.position).normalized().angle())

func _wait_for_fire_signal():
	var wait_timer = get_tree().create_timer(3.5)
	await wait_timer.timeout
	_fire()
