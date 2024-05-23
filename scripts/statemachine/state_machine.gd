class_name StateMachine
extends Node
 
@export var current_state: State
var states: Dictionary = {}

@onready var timer := $TransitionTimeout
var can_transition := true

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transitioned.connect(on_child_transitioned)
		else:
			push_warning("State machine contains child which is not 'State'")
			
	current_state.enter()
			
func _process(delta):
	current_state.process(delta)
		
func _physics_process(delta):
	current_state.physics_process(delta)
	
func on_child_transitioned(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)	
	print(new_state)

	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
			
			timer.start()
			can_transition = false
	else:
		push_warning("Called transition on a state that does not exist")

func _on_transition_timeout_timeout() -> void:
	can_transition = true
