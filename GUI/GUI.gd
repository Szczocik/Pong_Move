extends CanvasLayer


func _ready():
	$Control/TextureRect/HBoxContainer/PlayerScore.text = "3"
	
func update_GUI(PlayerScore):
	$Control/TextureRect/HBoxContainer/PlayerScore.text = str(PlayerScore)
