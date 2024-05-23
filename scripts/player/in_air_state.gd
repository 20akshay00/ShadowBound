class_name InAirState
extends State
 
@export var actor: CharacterBody2D

func enter():
	actor.velocity = actor.JUMP_VELOCITY * actor.gravity_direction
	actor.gravity_direction = Vector2(0, 1)
	actor.move_direction = Vector2(0, 0)
	
func physics_process(_delta):
	if actor.castR.is_colliding():
		transitioned.emit("OnRightWallState")
	elif actor.castL.is_colliding():
		transitioned.emit("OnLeftWallState")
	elif actor.castU.is_colliding():
		transitioned.emit("OnCeilingState")
	elif actor.castD.is_colliding():
		transitioned.emit("OnFloorState")
