extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.name == "enemybulletarea" || area.name == "bullets":
		pass
	elif area.name == "enemy1area" || "enemy2area":
		area.get_parent().health -= 1
		print(str(area.get_parent().health))
		get_parent().queue_free()
		
