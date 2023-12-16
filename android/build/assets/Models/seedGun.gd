extends Node3D

@onready var seed_instance = preload("res://Models/seed_instance.tscn")
@export var seed_gun_muzzle : Node3D
@export var root_node : Node3D
@onready var seed_gun = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("water_plant") && seed_gun.is_visible_in_tree():
		var seed = seed_instance.instantiate()
		add_child(seed)
		seed.transform = seed_gun_muzzle.global_transform
		seed.water_shot()
	pass
