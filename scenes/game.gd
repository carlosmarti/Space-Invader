extends Node2D

@export var introResources : DialogueResource
@onready var resourceGroup = $ResourceGroup
@onready var gameOverMenu = $gameover
@onready var pausedMenu = $Pause
@onready var playerStartingPos = $PlayerShip.position
@onready var enemyStartingPos = $EnemyShip.position
@onready var playerStartingRotation = $PlayerShip.rotation
@onready var enemyStartingRotation = $EnemyShip.rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#DialogueManager.show_example_dialogue_balloon(introResources, "start")
	#DialogueManager.dialogue_ended.connect(introDialogueFinished)
	
	#freezeCharacters()

func freezeCharacters():
	$PlayerShip.set_physics_process(false)
	$PlayerShip.set_process_input(false)
	$EnemyShip.set_physics_process(false)
	$EnemyShip.set_process_input(false)

func introDialogueFinished(_resource):
	$PlayerShip.set_physics_process(true)
	$PlayerShip.set_process_input(true)
	$EnemyShip.set_physics_process(true)
	$EnemyShip.set_process_input(true)

func addPlanet():
	pass

func reset():
	$PlayerShip.reset()
	$EnemyShip.reset()
	
	#return player and enemy back to starting point
	$PlayerShip.position = playerStartingPos
	$EnemyShip.position = enemyStartingPos
	$PlayerShip.rotation = playerStartingRotation
	$EnemyShip.rotation = enemyStartingRotation
	

func gameOver():
	get_tree().paused = true
	gameOver().visible = true

func pause():
	pausedMenu.visible = true
	get_tree().paused = true

func addResource(resource):
	resourceGroup.add_child(resource)

func triggerCutScene():
	pass
