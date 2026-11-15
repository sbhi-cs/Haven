extends CharacterBody2D

var scene = preload("res://bullets.tscn")

@onready var spamlabel = get_node("../spamlabel")
@onready var timelabel = get_node("../timelabel")
@onready var countlabel = get_node("../countlabel")


var lives = 3
var prevlives = 3
var iframes = 0
var charspeed = 300.0
var shoottimer = 0
var fatal = false
var resspam = 0
var resstate = false
var deathtimer = 0.1
var dead = false
var timestring = " "
var countstring = " "

func _physics_process(delta: float) -> void:

	if !fatal:
		var directionx := Input.get_axis("ui_left", "ui_right")
		if directionx:
			velocity.x = directionx * charspeed
		else:
			velocity.x = move_toward(velocity.x, 0, charspeed)
		
		var directiony := Input.get_axis("ui_up", "ui_down")
		if directiony:
			velocity.y = directiony * charspeed
		else:
			velocity.y = move_toward(velocity.y, 0, charspeed)
		
		if Input.is_action_pressed("shoot"):
			if shoottimer <= 0:
				var bullet = scene.instantiate()
				add_sibling(bullet)
				bullet.global_position = global_position
				shoottimer = 0.08
				global_position.y -= -3 # he bouncing back
		shoottimer -= delta
	
	if iframes > 0:
		iframes -= delta
	
	
	if lives != prevlives:
		fatal = true
		resstate = true
		deathtimer = 4
		
	if lives <= 0:
		dead = true
		
	if fatal != true:
		if iframes > 0.75:
			visible = false
		elif iframes > 0.5:
			visible = true
		elif iframes > 0.25:
			visible = false
		else:
			visible = true
	
	if fatal == true:
		prevlives = lives
		iframes = 1
		velocity.x = 0
		deathtimer -= delta
		if global_position.y < 690 && resstate == true:
			velocity.y = 180
			deathtimer += delta
		elif spamlabel.visible == false:
			spamlabel.visible = true
			timelabel.visible = true
			countlabel.visible = true
			global_position.x = 576
			velocity.y = 0
		elif Input.is_action_just_pressed("shoot"):
			resspam += 1
		if resspam >= 10:
			resstate = false
			spamlabel.visible = false
			timelabel.visible = false
			countlabel.visible = false
			if global_position.y > 540:
				velocity.y = -80
			else:
				resspam = 0
				fatal = false
				deathtimer = 0.1
		elif deathtimer <= 0:
			dead = true
		timestring = str("YOU HAVE ", snapped(deathtimer, 0.01), " SECONDS LEFT")
		timelabel.text = timestring
		countstring = str(resspam*100/100, "/10")
		countlabel.text = countstring
		print(str(deathtimer))
	move_and_slide()
