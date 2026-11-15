extends CharacterBody2D

@onready var diesfx = $diesfx

var speed = 150
var prevhealth = 75
var health = 75
var enemybulletscene = preload("res://enemybullet.tscn")
var shoottimer = 1

func _physics_process(delta: float) -> void:
	shoottimer -= delta
	if shoottimer <= 0:
		var xrotation = 0
		var yrotation = 0
		for j in range(5):
			for i in range(16):
				var bullet1 = enemybulletscene.instantiate()
				add_sibling(bullet1)
				bullet1.global_position = global_position
				bullet1.velocity = speed * Vector2.from_angle(deg_to_rad(i * 22.5))
				shoottimer = 3
			await get_tree().create_timer(0.2).timeout
			xrotation = 11.25
			yrotation = 11.25
			for i in range(16):
				var bullet1 = enemybulletscene.instantiate()
				add_sibling(bullet1)
				bullet1.global_position = global_position
				bullet1.velocity = speed * Vector2.from_angle(deg_to_rad((i * 22.5)+xrotation))
				shoottimer = 3
			await get_tree().create_timer(0.2).timeout
			xrotation = 0
			yrotation = 0
		
	
	if prevhealth != health:
		prevhealth = health
		Global.score += (100)
		diesfx.play()
	
	if health <= 0:
		Global.score += 15000
		Global.enemieskilled += 1
		queue_free()

# MAKE CHARACTER NOT BE ABLE TO GO PAST SCREEN

	move_and_slide()
