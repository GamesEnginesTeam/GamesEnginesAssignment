extends RigidBody3D

const Water_Speed = 10
var rng = RandomNumberGenerator.new()
var water_Recoil_X = rng.randf_range(-30, 30)
var water_Recoil_Z = rng.randf_range(1, 5)
var node_name = "Water"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
	await get_tree().create_timer(4).timeout
	queue_free()

func water_shot():
	# Shoot with Recoil
	# linear_velocity = (-transform.basis.z * Water_Speed * water_Recoil_Z) + (transform.basis.x * water_Recoil_X)
	
	
	linear_velocity = (-transform.basis.z * Water_Speed)

# When entering an area, do something
func _on_area_3d_area_entered(area):
	pass
# When something enters the waters area, do something
func _on_water_area_body_entered(body):
	print(body.name)
	queue_free()
