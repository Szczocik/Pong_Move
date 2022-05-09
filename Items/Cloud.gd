extends Area2D

var cloud_speed = 100

func _process(delta):
	position.y += cloud_speed * delta
	

func _on_Cloud_body_entered(body):
	pass
