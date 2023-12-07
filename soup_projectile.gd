extends RigidBody2D

func _on_area_2d_body_entered(body):
	if body.is_in_group('player'):
		body.die()

func _process(delta):
	transform.origin.x += -400 * delta
