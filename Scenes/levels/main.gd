extends Node2D

@onready var ox = load("res://Scenes/ox.tscn")
@onready var kiwi = load("res://Scenes/kiwi.tscn")

var level_speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_oxtiemr_timeout():
	var new_ox = ox.instantiate()
	new_ox.position = Vector2($Player.position.x + 1000, $Player.position.y + randi_range(-25,25))
	add_child(new_ox)


func _on_kiwitimer_timeout():
	var new_kiwi = kiwi.instantiate()
	new_kiwi.position = Vector2($Player.position.x + 1000, $Player.position.y + randi_range(-25,25))
	add_child(new_kiwi)
