extends Node3D

@export
var waterDroplet = Node3D
var flower = Node3D
var groundMoistureCounter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# This is the Ground 
func _on_area_3d_body_entered(body):
	print(body.name)
	
	if body.name == "Water":
		# flower.instantiate()
		groundMoistureCounter = groundMoistureCounter + 1
		print(groundMoistureCounter)
		pass

	if body.name == "Player":
		print("The player has hit the ground!")
		pass
