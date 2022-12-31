extends KinematicBody2D

export (int) var speed = 120
var velocity = Vector2()

onready var animationPlayer = $AnimationPlayer	
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
	
#Check input for movement
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		
	velocity = velocity.normalized() * speed
	
	#Animation Tree
	if velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Walk/blend_position", velocity)
		animationState.travel("Walk")
	else:
		animationState.travel("Idle")
			
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
