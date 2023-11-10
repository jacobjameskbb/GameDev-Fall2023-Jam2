extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_button_up():
	get_tree().change_scene_to_file("res://Level 0.tscn")


func _on_music_check_box_toggled(button_pressed):
	Global.music = button_pressed


func _on_volume_slider_drag_ended(value_changed):
	Global.volume = db_to_linear(value_changed) - 40
