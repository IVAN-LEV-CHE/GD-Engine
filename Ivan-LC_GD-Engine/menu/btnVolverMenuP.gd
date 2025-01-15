extends Control

var change_sceneP = load("res://menuP.tscn")

func _on_volver_pressed():
	get_tree().change_scene_to_packed(change_sceneP)
	pass # Replace with function body.
