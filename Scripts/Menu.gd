extends Control

#ready
func _ready():
	Global.volume = linear_to_db($VBoxContainer/VolumeSlider.value) - 40






func _on_start_button_button_up():
	get_tree().change_scene_to_file('res://Scenes/levels/Level 0.tscn')


func _on_music_check_box_toggled(button_pressed):
	Global.music = button_pressed



func _on_volume_slider_value_changed(value):
	Global.volume = linear_to_db(value) - 40
