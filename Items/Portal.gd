extends Node2D



func _on_Area2D_body_entered(body):
	get_tree().call_group("Gamestate", "portal_up")
	get_tree().call_group("BallGroup","restart_ball")
