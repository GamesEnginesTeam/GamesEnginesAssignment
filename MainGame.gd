extends Node3D

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
	if (groundMoistureCounter == 100):
		print("Flower is Complete!")
		# groundMoistureCounter = 0
	
	if body.get_groups().has("water") && groundMoistureCounter < 100:
		var createdFlower = flower.instantiate()
		add_child(createdFlower)
		createdFlower.transform = flowerSpawnPoint.global_transform
		groundMoistureCounter = groundMoistureCounter + 1
		print("Flower is " + str(groundMoistureCounter) + "% moisturized!!!")
		pass

	if body.name == "Player":
		print("The player has hit the ground!")
		pass
