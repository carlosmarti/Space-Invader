extends Area2D

var sprite
var spritePath = "res://images/bullet/resource-"
var randNum

@export var maxRotation = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $Sprite2D
	
	var randNumGen = RandomNumberGenerator.new()
	randNum = randNumGen.randi_range(1, 5)
	var tex = load(spritePath + str(randNum) + ".png")
	sprite.texture = tex
	
	#randomly rotate the resource
	randNum = randNumGen.randf_range(-1, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += randNum * delta
