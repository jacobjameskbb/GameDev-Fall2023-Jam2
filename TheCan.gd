extends Node2D

@onready var projectile = preload("res://soup_projectile.tscn")

var health = 100

func _on_area_2d_body_entered(body):
	if body.is_in_group('player_bullet'):
		health -= 1

func _on_area_2d_2_body_entered(body):
	if body.is_in_group('player'):
		get_parent().level_speed = 0
		_wait_for_fire_signal()

func _fire():
	var new_projectile = projectile.instantiate()
	add_child(new_projectile)
	for body in $Area2D2.get_overlapping_bodies():
		if body.is_in_group('player'):
			new_projectile.rotation = new_projectile.position.angle_to(body.position)

func _wait_for_fire_signal():
	var wait_timer = get_tree().create_timer(3.5)
	await wait_timer.timeout
	_fire()

func _process(_delta):
	if health <= 0:
		get_parent().level_speed = 2
		queue_free()
	position.x -= get_parent().level_speed
