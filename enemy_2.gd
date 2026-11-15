extends CharacterBody2D

var speed = 150
var prevhealth = 32
var health = 32
var enemybulletscene = preload("res://enemybullet.tscn")
var shoottimer = 1

@onready var diesfx = $diesfx

func _physics_process(delta: float) -> void:
	shoottimer -= delta
	if shoottimer <= 0:
		var xrotation = 0
		var yrotation = 0
		for i in range(16):
			var bullet1 = enemybulletscene.instantiate()
			add_sibling(bullet1)
			bullet1.global_position = global_position
			bullet1.velocity = speed * Vector2.from_angle(deg_to_rad(i * 22.5))
			shoottimer = 4
	
	if prevhealth != health:
		prevhealth = health
		Global.score += (3200/20)
		diesfx.play()
	
	if health <= 0:
		Global.score += 2500
		Global.enemieskilled += 1
		queue_free()

# MAKE CHARACTER NOT BE ABLE TO GO PAST SCREEN

	move_and_slide()
