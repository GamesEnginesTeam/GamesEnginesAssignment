extends CharacterBody3D

# Base Character Variables
@export var SPEED : float = 5.0
@export var JUMP_VELOCITY : float = 4.5

@export var MOUSE_SENSITIVITY : float = 0.5
@export var TILT_LOWER_LIMIT := deg_to_rad(-70.0)
@export var TILT_UPPER_LIMIT := deg_to_rad(70.0)
@export var CAMERA_CONTROLLER : Camera3D

var _mouse_input : bool = false
var _mouse_rotation : Vector3
var _rotation_input : float
var _tilt_input : float
var _player_rotation : Vector3
var _camera_rotation : Vector3

# Game Specific Variables
@export var watering_can = preload("res://Models/WateringCan.tscn").instantiate()
@export var seed_gun = preload("res://Models/seedGun.tscn").instantiate()
@export var player_camera = Camera3D
@onready var camera_ray = $CameraController/Camera3D/RayCast3D
@export var tool_placement = Node3D
@export var root : Node3D

# List of Tools for the player to use
enum tools {
	GUN, 
	CAN
}
var tool = tools.GUN

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event):
	if event.is_action_pressed("debug_exit"):
		get_tree().quit()

func _unhandled_input(event):
	_mouse_input = event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	if _mouse_input:
		_rotation_input = -event.relative.x  * MOUSE_SENSITIVITY
		_tilt_input = -event.relative.y * MOUSE_SENSITIVITY
		# print(Vector2(_rotation_input,_tilt_input))

func _update_camera(delta):

	# Rotate camera using euler rotation
	_mouse_rotation.x += _tilt_input * delta
	_mouse_rotation.x = clamp(_mouse_rotation.x, TILT_LOWER_LIMIT, TILT_UPPER_LIMIT)
	_mouse_rotation.y += _rotation_input * delta

	_player_rotation = Vector3(0.0, _mouse_rotation.y, 0.0)
	_camera_rotation = Vector3(_mouse_rotation.x, 0.0, 0.0)

	CAMERA_CONTROLLER.transform.basis = Basis.from_euler(_camera_rotation)
	CAMERA_CONTROLLER.rotation.z = 0.0

	global_transform.basis = Basis.from_euler(_player_rotation)

	_rotation_input = 0.0
	_tilt_input = 0.0

func _ready():
	watering_can.global_position = tool_placement.global_position
	seed_gun.global_position = tool_placement.global_position
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Rotate the camera
	_update_camera(delta)

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	
	# Tool Switching
	if Input.is_action_just_pressed("switch_items"):
		switch_tool()
	
func switch_tool():
	# tool_picker + 1
	# if (tool_picker > 2):
	#	tool_picker = 1
	match tool:
		tools.GUN:
			print("SWITCHING FROM GUN")
			tool = tools.CAN
			seed_gun.hide()
			watering_can.show()
		tools.CAN:
			print("SWITCHING FROM CAN")
			tool = tools.GUN
			watering_can.hide()
			seed_gun.show()
