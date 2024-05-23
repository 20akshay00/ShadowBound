class_name OnLeftWallState
extends State
 
@export var actor: CharacterBody2D
 
func enter() -> void:
	actor.gravity_direction = Vector2(1, 0)
			
func physics_process(_delta):
	actor.move_direction = Input.get_axis("up", "down") * Vector2(1, 0)
	
	if actor.castD.is_colliding() and Input.is_action_just_pressed("down"):
		transitioned.emit("OnFloorState")
	elif actor.castU.is_colliding() and Input.is_action_just_pressed("up"):
		transitioned.emit("OnCeilingState")
		
	if Input.is_action_just_pressed("left"):
		transitioned.emit("InAirState")	
