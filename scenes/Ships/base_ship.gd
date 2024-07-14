extends CharacterBody2D

@export var health = 100
@export var SPEED = 200.0
@onready var bulletPreload = preload("res://scenes/Ships/bullet.tscn")
@onready var explosion = load("res://scenes/planets/explosion.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func shoot():
	pass

func takeDamage(amount, shipName):
	health -= amount
	if health == 0:
		dead(shipName)
	print("Amount of health left for " + shipName + ": ", health)

func dead(shipName):
	var explosionInst = explosion.instantiate()
	explosionInst.set_emitting(true)
	explosionInst.position = position
	get_parent().add_child(explosionInst)
	
	if shipName == "PlayerShip":
		get_parent().gameOver()
	elif shipName == "EnemyShip":
		get_parent().triggerCutScene()

func reset():
	health = 100

func getHealth():
	return health
