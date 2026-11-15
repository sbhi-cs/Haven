extends CharacterBody2D


const SPEED = -600.0

func _ready():
	velocity.y = SPEED

func _physics_process(delta: float) -> void:
	move_and_slide()
	if global_position.y < -20:
		queue_free()
