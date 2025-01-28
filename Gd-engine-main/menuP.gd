extends Control

var change_sceneJ = load("res://menuJ.tscn")

func _on_button_pressed():
	$"/root/Global/ButtonPress1".play()
	$"/root/Global/AudioStreamPlayer2D".stop()
	$"/root/Global/RedSunInTheSky".play()
	get_tree().change_scene_to_packed(change_sceneJ)
	pass

var change_sceneI = load("res://menuI.tscn")

func _on_instrucciones_pressed():
	$"/root/Global/ButtonPress1".play()
	get_tree().change_scene_to_packed(change_sceneI)
	pass # Replace with function body.

var change_sceneC = load("res://menuC.tscn")

func _on_creditos_pressed():
	$"/root/Global/ButtonPress1".play()
	get_tree().change_scene_to_packed(change_sceneC)
	pass # Replace with function body.
