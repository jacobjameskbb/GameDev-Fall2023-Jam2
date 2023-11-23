extends CharacterBody2D

@onready var player = get_parent().get_node('Player')
var flying = false

var speed = 100
func _physics_process(delta):
	if not flying:
		position.x -= get_parent().level_speed
	else:
		position += transform.x * speed * delta
	

func _on_player_locator_body_entered(body):
	if body.is_in_group('player'):
		jump()
		
func jump():
	$AnimatedSprite2D.animation = 'crouch'
	await get_tree().create_timer(1).timeout
	$AnimatedSprite2D.animation = 'kiwi'
	look_at(player.global_position)
	flying = true
