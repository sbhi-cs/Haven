extends CharacterBody2D


const SPEED = 300.0

func _draw():
	draw_circle(Vector2(0, 0), 4, Color.BLACK)


func _physics_process(delta: float) -> void:
	if global_position.x > 1200 || global_position.x < 0 || global_position.y > 1000 || global_position.y < 0:
		queue_free()


	move_and_slide()
