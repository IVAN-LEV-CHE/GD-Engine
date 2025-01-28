extends Control

var change_sceneP = load("res://menuP.tscn")

func _on_volver_pressed():
	$"/root/Global/ButtonPress1".play()
	$"/root/Global/RedSunInTheSky".stop()
	$"/root/Global/AudioStreamPlayer2D".play()
	get_tree().change_scene_to_packed(change_sceneP)
	pass # Replace with function body.
