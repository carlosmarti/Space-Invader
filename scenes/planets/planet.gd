extends Area2D

@onready var resource = load("res://scenes/planets/resource.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	pass # Replace with function body.

func dropResources():
	for num in range(0, 5):
		var resourceInst = resource.instantiate()
		#postiion the resource correctly
		resourceInst.position = position
		get_parent().addResource(resourceInst)
