extends KinematicBody2D

var speed = 270
var ball


func _ready():
	ball = get_parent().find_node("Ball")


func _physics_process(delta):
	move_and_slide(Vector2(get_opponent_direction() * speed, 0))
	
	
func get_opponent_direction():
	if abs(ball.position.x - position.x) > 25:
		if ball.position.x > position.x: return 1
		else: return -1
	else: return 0
	

