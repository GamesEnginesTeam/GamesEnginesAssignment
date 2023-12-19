extends Node3D

@export
var flower = preload("res://Models/Flower.tscn")
var flowerCounter = 0

@export
var DirtFlowerSpawn : Node3D

@export
var GroundArea : Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _on_ground_area_body_entered(body):
	#
	#if body.get_groups().has("water"):
		#if (flowerCounter < 1):
			#flowerCounter = flowerCounter + 1
			#var createdFlower = flower.instantiate()
			#add_child(createdFlower)
			#GroundArea.queue_free()
