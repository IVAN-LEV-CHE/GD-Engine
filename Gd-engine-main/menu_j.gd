extends Node2D

var change_sceneP = load("res://menuP.tscn")

func _on_button_pressed() -> void:
	$"/root/Global/ButtonPress1".play()
	$"/root/Global/RedSunInTheSky".stop()
	$"/root/Global/AudioStreamPlayer2D".play()
	get_tree().change_scene_to_packed(change_sceneP)
	pass # Replace with function body.
