extends Node2D

export(Gradient) var daylight_gradient
onready var light_canvas : CanvasModulate = get_node ("/root/main/CanvasModulate")

var time = 0

func _ready():
	pass

func _process(delta):
	time += 0.001
	
	if(time > 1):
		time = 0
		
	light_canvas.color = daylight_gradient.interpolate(time)
	pass
