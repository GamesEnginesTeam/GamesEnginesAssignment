extends Node3D

@onready var water_droplet = preload("res://Models/water_drop.tscn")
@export var watering_can_muzzle : Node3D
@export var root_node : Node3D
@onready var watering_can = $"."

@export
var firerateTimer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("water_plant") && watering_can.is_visible_in_tree() && firerateTimer.is_stopped():
		var water = water_droplet.instantiate()
		root_node.add_child(water)
		water.transform = watering_can_muzzle.global_transform
		water.water_shot()
		firerateTimer.start()
		
	pass
