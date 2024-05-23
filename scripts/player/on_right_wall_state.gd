class_name OnRightWallState
extends State
 
@export var actor: CharacterBody2D
 
func enter() -> void:
	actor.gravity_direction = Vector2(1, 0)
	
func physics_process(_delta):
	if actor.castU.is_colliding():
		transitioned.emit("OnCeilingState")
	elif actor.castD.is_colliding():
		transitioned.emit("OnFloorState")
		
	if Input.is_action_just_pressed("right"):
		transitioned.emit("InAirState")	
