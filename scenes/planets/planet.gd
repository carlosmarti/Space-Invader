extends Area2D

@onready var resource = load("res://scenes/planets/resource.tscn") 
@onready var explosion = load("res://scenes/planets/explosion.tscn")
@onready var animationPlayer = $AnimationPlayer
@onready var randomGen = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_home"):
		animationPlayer.play("destroy")

func addExplosion():
	var explosionInst = explosion.instantiate()
	explosionInst.set_emitting(true)
	explosionInst.position = position
	var randNum = randomGen.randi_range(-10, 10)
	explosionInst.position.x += randNum
	randNum = randomGen.randi_range(-10,10)
	explosionInst.position.y += randNum
	get_parent().add_child(explosionInst)

func _on_area_entered(area):
	var areaGroups = area.get_groups()
	for group in areaGroups:
		if group == "beam":
			animationPlayer.play("attacked")

func dropResources():
	var resourceInst = resource.instantiate()
	#postiion the resource correctly
	resourceInst.position = position
	get_parent().addResource(resourceInst)


func _on_area_exited(area):
	var areaGroups = area.get_groups()
	for group in areaGroups:
		if group == "beam":
			animationPlayer.stop()

func releasePlanet():
	queue_free()
