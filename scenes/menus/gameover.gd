extends Control

@onready var mainmenu = 'res://Scenes/main_menu.tscn'



func _on_retry_pressed():
	visible = false
	get_tree().paused = false
	get_parent().reset()


func _on_mainmenu_pressed():
	get_tree().paused = false
	SceneChanger.changeScene(mainmenu)


func _on_exit_pressed():
	get_tree().quit()
