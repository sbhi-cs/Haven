extends Label

var heighttext = " "

func _process(delta: float) -> void:
	heighttext = str("HEIGHT: ", Global.height, "M")
	text = heighttext
