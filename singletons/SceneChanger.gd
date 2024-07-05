extends Node


func changeScene(scene):
	var returned = get_tree().change_scene_to_file(scene)
	if returned == ERR_CANT_OPEN:
		print("change scene can't find the path provided")
	elif returned == OK:
		print("change scene found the path provided: " + scene)
