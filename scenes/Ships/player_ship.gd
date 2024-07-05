extends "res://scenes/Ships/base_ship.gd"

@export var angularSpeed = 20
@onready var bulletPosition = $BulletPosition
@export var minAngle = deg_to_rad(0.0)
@export var maxAngle = deg_to_rad(90.0)
@export var lerpAnglWeight = 3
@export var playerSpeed = 5

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left-key", "Right-key")
	if direction != 0:
		rotation = lerp_angle(rotation, rotation + direction, lerpAnglWeight * delta)
		#lerpAnglWeight += delta
	
	
	if Input.is_action_pressed("Up"):
		velocity = lerp(Vector2.UP, Vector2.UP.rotated(rotation) * SPEED * playerSpeed, 2 * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 1 * delta)
	
	move_and_slide()

func shoot():
	var bulletInstance = bulletPreload.instantiate()
	get_parent().add_child(bulletInstance)
	bulletInstance.position = bulletPosition.get_global_position()
	bulletInstance.direction = rotation
	bulletInstance.rotation = rotation
