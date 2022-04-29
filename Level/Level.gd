extends Node



func _on_Bottom_body_entered(body):
	$Ball.position = Vector2(300,512)


func _on_Top_body_entered(body):
	$Ball.position = Vector2(300,512)
