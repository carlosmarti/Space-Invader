extends "res://scenes/Ships/base_ship.gd"

@onready var playerNode = get_parent().get_node("PlayerShip")
@onready var MAXSCREENSIZE = get_viewport().get_visible_rect().size
@onready var bulletPosition = $Marker2D
var randGen
var moveTimer
var randPosition = Vector2.ZERO
var angleToPosition
var tween
@export var movementSpeed = 50
@export var rotationSpeed = 2

func _ready():
	moveTimer = $MovementTimer
	randGen = RandomNumberGenerator.new()
	

func _physics_process(delta):
	rotateToPlayer(playerNode, delta)
	
	move_and_slide()

func rotateToPlayer(player, delta):
	var direction = (player.global_position - global_position)
	var angleTo = transform.x.angle_to(direction) + deg_to_rad(90)
	rotate(sign(angleTo) * min(delta * rotationSpeed, abs(angleTo)))

func _on_movement_timer_timeout():
	randPosition = Vector2(randGen.randi_range(20, MAXSCREENSIZE.x - 20), randGen.randi_range(20, MAXSCREENSIZE.y - 20))
	tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(self, "position", randPosition, 5)


func _on_shooting_timer_timeout():
	var bulletInstance = bulletPreload.instantiate()
	get_parent().add_child(bulletInstance)
	bulletInstance.position = bulletPosition.get_global_position()
	bulletInstance.direction = rotation
	bulletInstance.rotation = rotation
