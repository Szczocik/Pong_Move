extends Area2D



func _on_JumpPad_body_entered(body):
	get_tree().call_group("GameState","speed_ball")
	
