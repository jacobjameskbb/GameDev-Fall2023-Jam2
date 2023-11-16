extends CharacterBody2D
@onready var player = get_parent().get_node("Player")

@export var cooldown = 40
@onready var cooldown_number = cooldown

@onready var bullet = preload("res://Scenes/monkey_bullet.tscn")

@export var bullet_speed = 50

var dead = false

var vel_y = 2

var gravity = 0.1

var can_shoot = false
func _process(delta):
	
	position.x -= get_parent().level_speed
	
	if player.global_position.y < self.global_position.y and not dead and can_shoot:
		if player.global_position.x < self.global_position.x:
			$monkey.flip_h = false
		else:
			$monkey.flip_h = true
		$barrel.look_at(player.global_position)
		$barrel.rotation_degrees += 90
		cooldown_number -=1
		if cooldown_number <= 0:
			cooldown_number = cooldown
			var new_bullet = bullet.instantiate()
			get_parent().add_child(new_bullet)
			new_bullet.global_position = $barrel/Marker2D.global_position
			new_bullet.rotation_degrees = $barrel.rotation_degrees
			new_bullet.speed = bullet_speed
	elif dead:
		$monkey.position.y -= vel_y * delta * 100
		vel_y -= gravity

func _on_area_2d_body_entered(body):
	if body.is_in_group('player_bullet'):
		
		dead = true
		$monkey.region_rect.position.y = 16



func _on_player_area_body_entered(body):
	if body.is_in_group('player'):
		can_shoot = true


func _on_player_area_body_exited(body):
	if body.is_in_group('player'):
		can_shoot = false
