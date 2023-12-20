extends Area3D

@export_file("*.tscn")
var target_scene : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("TRIGGERED LAVA")
	var scene_base : XRToolsSceneBase = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")
	if not scene_base:
		return
	
	print("LOADING SAME SCENE")
	
	# Start loading the target scene
	scene_base.load_scene(target_scene)
