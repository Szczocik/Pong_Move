extends Area2D



func _on_JumpPad_body_entered(body):
	get_tree().call_group("BallGroup","speed_ball")
	
