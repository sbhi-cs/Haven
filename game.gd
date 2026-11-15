extends Node2D

@onready var character = $character

var enemy1 = preload("res://enemy_1.tscn")
var enemy2 = preload("res://enemy_2.tscn")
var enemy3 = preload("res://enemy_3.tscn")
var enemynum = 0
var enemypos = Vector2(0, 0)
var timer = 2

func _physics_process(delta: float) -> void:
	if character.fatal == false:
		Global.height += 1
		if timer <= 0:
			enemynum = randi() % 2
			enemypos.x = (randi() % 720) + 128
			enemypos.y = (randi() % 300) + 80
			
			if enemynum == 0:
				var enemy1spawn = enemy1.instantiate()
				enemy1spawn.global_position = enemypos
				add_child(enemy1spawn)
			elif enemynum == 1:
				var enemy2spawn = enemy2.instantiate()
				enemy2spawn.global_position = enemypos
				add_child(enemy2spawn)
		
			timer = 5
			for i in range(Global.enemieskilled):
				timer *= 0.98
		# speed up enemy spawn speed based on how many enemies killed
	
	if Global.height % 2000 == 0:
		var enemy3spawn = enemy3.instantiate()
		enemy3spawn.global_position = Vector2(576, 120)
		add_child(enemy3spawn)
	
	timer -= delta
	
	if character.dead == true:
		get_tree().change_scene_to_file("res://losescreen.tscn")
