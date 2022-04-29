extends KinematicBody2D

var speed = 600
var velocity = Vector2.ZERO

func _ready():
	velocity.x = [-0.8,0.8][randi() % 2]
	velocity.y = [-1,1][randi() % 2]
	
func _physics_process(delta):
	move_and_slide(velocity * speed)
