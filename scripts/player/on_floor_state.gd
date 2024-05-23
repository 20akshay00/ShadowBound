class_name OnFloorState
extends State
 
@export var actor: CharacterBody2D
 
func enter() -> void:
	actor.gravity_direction = Vector2(0, 1)
	
func physics_process(_delta):	
	actor.move_direction = Input.get_axis("left", "right") * Vector2(1, 0)
	
	if actor.castR.is_colliding() and Input.is_action_just_pressed("right"):
		transitioned.emit("OnRightWallState")
	elif actor.castL.is_colliding() and Input.is_action_just_pressed("left"):
		transitioned.emit("OnLeftWallState")
		
	if Input.is_action_just_pressed("up"):
		transitioned.emit("InAirState")
