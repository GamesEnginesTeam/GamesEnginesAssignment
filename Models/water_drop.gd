extends RigidBody3D

const Water_Speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
	pass # Replace with function body.

func water_stuff():
	apply_impulse(Vector3(0, 0, Water_Speed), Vector3(0, 0, -500))
	#apply_central_force(Vector3(0, 0, Water_Speed))
	#apply_force(Vector3(0, 0, Water_Speed), Vector3(0, 0, -500))

func _on_area_3d_area_entered(area):
	#queue_free()
	pass

