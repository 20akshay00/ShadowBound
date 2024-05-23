class_name OnCeilingState
extends State
 
@export var actor: CharacterBody2D
 
func enter() -> void:
	actor.gravity_direction = Vector2(0, -1)
	
func physics_process(_delta):
	if actor.castR.is_colliding():
		transitioned.emit("OnLeftWallState")
	elif actor.castL.is_colliding():
		transitioned.emit("OnRightWallState")
		
	if Input.is_action_just_pressed("jump"):
		transitioned.emit("InAirState")	
