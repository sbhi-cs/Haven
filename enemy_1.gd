extends CharacterBody2D

var speed = 150
var health = 20
var enemybulletscene = preload("res://enemybullet.tscn")
var shoottimer = 1


func _physics_process(delta: float) -> void:
	shoottimer -= delta
	if shoottimer <= 0:
		var xrotation = 0
		var yrotation = 0
		for i in range(8):
			var bullet1 = enemybulletscene.instantiate()
			add_sibling(bullet1)
			bullet1.global_position = global_position
			bullet1.velocity = speed * Vector2.from_angle(deg_to_rad(i * 45))
			shoottimer = 4
	
	if health <= 0:
		Global.score += 1000
		Global.enemieskilled += 1
		queue_free()
		
	move_and_slide()
