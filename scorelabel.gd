extends Label

var scoretext = " "

func _process(delta: float) -> void:
	scoretext = str("SCORE: ", Global.score)
	text = scoretext
