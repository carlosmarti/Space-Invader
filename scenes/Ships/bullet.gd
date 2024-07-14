extends CharacterBody2D

@export var bulletDamage = 10
@export var bulletSpeed = 600
var MAXSCREENSIZE = Vector2(640, 360)
var parentName
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	parentName = get_parent().name

func _physics_process(delta):
	
	var collidingInfo = move_and_collide(Vector2(0, -bulletSpeed).rotated(direction) * delta)
	
	if collidingInfo and collidingInfo.get_collider():
		var shipName = collidingInfo.get_collider().name
		if shipName == "EnemyShip" or shipName == "PlayerShip":
			collidingInfo.get_collider().takeDamage(bulletDamage, shipName)
			queue_free()
	
	if position.x > MAXSCREENSIZE.x or position.x < 0 or position.y > MAXSCREENSIZE.y or position.y < 0:
		queue_free()

