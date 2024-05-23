extends Sprite2D

@onready var light := $PointLight2D
@export var MEAN_INTENSITY: float = 1.5
@export var AMPLITUDE_INTENSITY: float = 0.5
@export var FREQUENCY: float = 2.

func _process(delta: float) -> void:
	light.energy = AMPLITUDE_INTENSITY * sin(FREQUENCY * Time.get_ticks_msec()) ** 2 + MEAN_INTENSITY
