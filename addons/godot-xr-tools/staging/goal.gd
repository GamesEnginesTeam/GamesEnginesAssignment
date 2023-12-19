extends Area3D

@export
var flowerGoal := 1

@export
var flowerCount := 0

@onready
var flowersGrown = $FlowersGrown

@onready
var flowerAmount = $FlowerAmount

@export_file("*.tscn")
var target_scene : String

var goal = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	goal.monitorable = false
	goal.monitoring = false
	flowersGrown.modulate = Color.RED
	flowerAmount.modulate = Color.RED
	flowerAmount.text = str(flowerCount) + " / " + str(flowerGoal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	flowerAmount.text = str(flowerCount) + " / " + str(flowerGoal)
	if (flowerCount == flowerGoal):
		goal.monitorable = true
		goal.monitoring = true
		flowersGrown.modulate = Color.GREEN
		flowerAmount.modulate = Color.GREEN

func _on_body_entered(body):
	var scene_base : XRToolsSceneBase = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")
	if not scene_base:
		return
		
	# Start loading the target scene
	scene_base.load_scene(target_scene)
	
func incrementFlowerCount():
	flowerCount = flowerCount + 1
