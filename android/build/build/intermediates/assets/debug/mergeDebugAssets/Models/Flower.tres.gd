extends Node3D

var groundMoistureCounter = 0

@onready 
var ObjectiveProgress = $ObjectiveProgress

@onready
var ObjectiveName = $ObjectiveName

@export
var platformName : Node3D

@onready
var flowerArea3dMonitoring = $Area3D.monitoring

@onready
var flowerArea3dMonitorable = $Area3D.monitorable

@onready
var flower = $"."

@export
var particles : GPUParticles3D

@onready
var flowerAudio : AudioStreamPlayer3D = $"./AudioStreamPlayer3D"

signal incrementFlowerCount()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_body_entered(body):
	if (groundMoistureCounter == 100 && flowerArea3dMonitoring):
		
		flowerArea3dMonitoring = false
		flowerArea3dMonitorable = false
		
		ObjectiveName.text = "Flower is Complete!"
		ObjectiveName.modulate = Color.GREEN
		ObjectiveProgress.modulate = Color.GREEN
		
		# Do something
		#goal.incrementFlowerCount().emit()
		emit_signal("incrementFlowerCount")
		
		#flowerArea3d.monitoring = false
		#flowerArea3d.monitorable = false
		
		particles.emitting = true
		flowerAudio.playing = true
	
	if body.get_groups().has("water") && groundMoistureCounter < 100:
		print(groundMoistureCounter)
		groundMoistureCounter = groundMoistureCounter + 1
		ObjectiveProgress.font_size = ObjectiveProgress.font_size + 3
		ObjectiveProgress.text = str(groundMoistureCounter) + "%"
