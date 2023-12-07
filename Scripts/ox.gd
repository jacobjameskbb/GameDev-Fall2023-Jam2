extends Node2D

var player_detected = false
var target = NAN
var SPEED = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= get_parent().level_speed
	
	var direction = Vector2(0,0)
	if player_detected:
		direction.x = -(self.position.x - target.position.x)/abs(self.position.x - target.position.x)

	if direction != Vector2(0,0):
		if !$AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.play("run")
			
		self.position += direction * SPEED * delta
			
	else:
		$AnimatedSprite2D.play("default")
		
	

func die():
	$AnimatedSprite2D.play("die")

func _on_hitbox_body_entered(body):
	print(body)
	if body.is_in_group('player_bullet'):
		die()
	if body.is_in_group('player'):
		body.die()


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == 'die':
		self.queue_free()


func _on_player_detect_body_entered(body):
	if body.is_in_group("player"):
		target = body
		player_detected = true
		$AnimatedSprite2D.play("run")


func _on_player_detect_body_exited(body):
	if body.is_in_group("player"):
		player_detected = false
