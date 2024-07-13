extends Node2D

@export var introResources : DialogueResource
@onready var resourceGroup = $ResourceGroup

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#DialogueManager.show_example_dialogue_balloon(introResources, "start")
	#DialogueManager.dialogue_ended.connect(introDialogueFinished)
	
	#freezeCharacters()

func freezeCharacters():
	$PlayerShip.set_physics_process(false)
	$PlayerShip.set_process_input(false)

func introDialogueFinished(_resource):
	$PlayerShip.set_physics_process(true)
	$PlayerShip.set_process_input(true)

func addPlanet():
	pass

func addResource(resource):
	resourceGroup.add_child(resource)
