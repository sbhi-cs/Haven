extends Label
var finalscore = " "

func _ready() -> void:
	finalscore = str("FINAL SCORE: ", Global.score)
	text = finalscore
