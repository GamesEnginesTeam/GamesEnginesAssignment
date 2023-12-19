extends RigidBody3D

const Water_Speed = 10
var rng = RandomNumberGenerator.new()
var water_Recoil_X = rng.randf_range(-30, 30)
var water_Recoil_Z = rng.randf_range(1, 5)
var node_name = "Water"

#@onready var _controller := XRHelpers.get_xr_controller(self)

@export
var waterRoot : Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_as_top_level(true)
	await get_tree().create_timer(2).timeout
	queue_free()
	pass

func water_shot(controller):
	# Shoot with Recoil
	# linear_velocity = (-transform.basis.z * Water_Speed * water_Recoil_Z) + (transform.basis.x * water_Recoil_X)
	
	#if !_controller.get_is_active():
		#print("CONTROLLER IN WATERDROP IS: " + str(_controller.get_is_active()))
		##return
	
	if (controller.get_float("trigger") > 0):
		linear_velocity = (-transform.basis.z * Water_Speed * (controller.get_float("trigger") * 10))
		#return
	
	#linear_velocity = (-transform.basis.z * Water_Speed)
	
	#linear_velocity = (-transform.basis.z * Water_Speed)

#func _on_body_entered(body):
	#queue_free()
