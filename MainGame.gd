extends Node3D

@export
var waterDroplet = Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_area_3d_body_entered(body):
	if body.name != "StaticBody3D":
		if body.name == "WaterDrop":
			print("A water droplet has hit the ground!")

		if body.name == "player":
			print("The player has hit the ground!")

		print("the object that hit the ground is: ", body.name)
