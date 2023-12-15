extends Node3D

@export
var waterDroplet = Node3D

@export
var flower = preload("res://Models/Flower.tscn")
var groundMoistureCounter = 0

@export
var flowerSpawnPoint = Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# This is the Ground 
func _on_area_3d_body_entered(body):
	# print(body.name)
	
	if body.name == "Water":
		var createdFlower = flower.instantiate()
		add_child(createdFlower)
		createdFlower.transform = flowerSpawnPoint.global_transform
		groundMoistureCounter = groundMoistureCounter + 1
		print(groundMoistureCounter)
		pass

	if body.name == "Player":
		print("The player has hit the ground!")
		pass
