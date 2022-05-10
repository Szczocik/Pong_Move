extends Area2D

var cloud_speed = 100


func _process(delta):
	position.y += cloud_speed * delta
	if position.y >= 300:
		$Sprite.modulate = Color(0.45,0.43,0.43,1)
	if position.y >= 800:
		$Sprite.modulate = Color(0.53,0.02,0.02,1)
		

func _on_Cloud_body_entered(body):
	$AudioStreamPlayer2D.play()
	get_tree().call_group("Gamestate", "coin_down")
	
	
