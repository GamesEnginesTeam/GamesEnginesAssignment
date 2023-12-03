extends RigidBody3D

const Water_Speed = 10
var rng = RandomNumberGenerator.new()
var water_Recoil_X = rng.randf_range(-30, 30)
var water_Recoil_Z = rng.randf_range(1, 5)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
	pass # Replace with function body.

func water_stuff():
	linear_velocity = (-transform.basis.z * Water_Speed * water_Recoil_Z) + (transform.basis.x * water_Recoil_X)

func _on_area_3d_area_entered(area):
	pass

func _on_water_area_body_entered(body):
	queue_free()
