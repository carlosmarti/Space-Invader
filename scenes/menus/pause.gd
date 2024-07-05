extends Control

@onready var main_menu = 'res://Scenes/main_menu.tscn'



func _on_resume_pressed():
	print("resume pressed")
	get_parent().hidePauseMenu()
	get_tree().paused = false



func _on_mainmenu_pressed():
	print("change scene requested")
	get_tree().paused = false
	SceneChanger.changeScene(main_menu)
