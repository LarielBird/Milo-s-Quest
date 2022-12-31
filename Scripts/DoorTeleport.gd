extends Area2D

export(String, FILE, "*.tscn") var world_scene
export var xcoor = 1
export var ycoor = 1
var roomchange = 0

func position(to):
	global_position.x = to
	
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" && Input.is_action_just_released('action'):
			get_tree().change_scene(world_scene)
			

