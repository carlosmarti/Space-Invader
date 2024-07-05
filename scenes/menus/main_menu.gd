extends Control

var gameScene

func _ready():
	gameScene = 'res://scenes/game.tscn'

func _on_start_pressed():
	SceneChanger.changeScene(gameScene)


func _on_exit_pressed():
	print("Closing out Game!")
	get_tree().quit()
