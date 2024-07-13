extends "res://scenes/Ships/base_ship.gd"

@onready var MAXSCREENSIZE = get_viewport().get_visible_rect().size
var randGen
var moveTimer
var move = false
var randPosition = Vector2.ZERO
var angleToPosition
var tween
@export var movementSpeed = 50

func _ready():
	tween = create_tween()
	moveTimer = $MovementTimer
	randGen = RandomNumberGenerator.new()
	

func _physics_process(delta):
	if move:
		velocity += lerp(velocity, randPosition,  delta)
		print(velocity)
		positionReached()
	
	move_and_slide()

func positionReached():
	if position > randPosition - Vector2(20, 20):
		move = false


func _on_movement_timer_timeout():
	randPosition = Vector2(randGen.randi_range(20, MAXSCREENSIZE.x - 20), randGen.randi_range(20, MAXSCREENSIZE.y - 20))
	angleToPosition = get_angle_to(randPosition)
	print("moving towareds: " + str(randPosition))
	move = true
