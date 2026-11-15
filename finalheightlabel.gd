extends Label
var finalheight = " "

func _ready() -> void:
	finalheight = str("HEIGHT: ", Global.height, "M")
	text = finalheight
