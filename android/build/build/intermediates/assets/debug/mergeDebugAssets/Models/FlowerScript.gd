extends Node3D

var groundMoistureCounter = 0

@export 
var ObjectiveProgress : Label3D

@export 
var ObjectiveName : Label3D

@export
var platformName : Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_body_entered(body):
	if (groundMoistureCounter == 100):
		ObjectiveName.text = "Flower is Complete!"
		ObjectiveName.modulate = Color.GREEN
		ObjectiveProgress.modulate = Color.GREEN
		
		# Do something
		if (platformName):
			platformName.show()
	
	if body.get_groups().has("water") && groundMoistureCounter < 100:
		groundMoistureCounter = groundMoistureCounter + 1
		ObjectiveProgress.font_size = ObjectiveProgress.font_size + 3
		ObjectiveProgress.text = str(groundMoistureCounter) + "%"
		
