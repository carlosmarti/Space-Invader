extends CharacterBody2D

@export var health = 100
@export var SPEED = 600.0
@onready var bulletPreload = preload("res://scenes/Ships/bullet.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func shoot():
	pass

func takeDamage(amount):
	health -= amount
	print("Amount of health left: ", health)

func getHealth():
	return health
