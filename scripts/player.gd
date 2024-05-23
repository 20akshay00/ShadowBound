extends CharacterBody2D

@onready var light := $PointLight2D
@export var MEAN_INTENSITY: float = 0.7
@export var AMPLITUDE_INTENSITY: float = 0.3
@export var FREQUENCY: float = 5.

@export var SPEED = 50.0
@export var JUMP_VELOCITY = -10.0
@export var GRAVITY: float = 1000.0

@export var gravity_direction := Vector2(0, 1)
@export var move_direction := Vector2(1, 0)
@onready var sprite := $AnimatedSprite2D

@onready var castR := $CastR
@onready var castL := $CastL
@onready var castU := $CastU
@onready var castD := $CastD

func _physics_process(delta: float) -> void:
	velocity += GRAVITY * gravity_direction * delta
		
	if move_direction:
		velocity = move_direction * SPEED
		sprite.flip_h = (velocity.x > 0)
		sprite.play("move")
	else:
		sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(delta: float) -> void:
		light.energy = AMPLITUDE_INTENSITY * sin(FREQUENCY * Time.get_ticks_msec()) ** 2 + MEAN_INTENSITY
