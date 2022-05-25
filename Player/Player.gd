extends KinematicBody2D

var speed = 400


func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	move_and_slide(velocity * speed)
	process_mouse()
	
	
func process_mouse():
	var target = get_viewport().get_mouse_position().x
	var paddle_width = get_node("CollisionShape2D").shape.extents.x
	var viewport_width = get_viewport().size.x
	if position.x < target:
		if not test_move(Transform2D(transform), Vector2(1,0)):
			position.x = min(target, viewport_width - paddle_width)
	elif position.x > target:
		if not test_move(Transform2D(transform), Vector2(-1,0)):
			position.x = max(target, paddle_width)
	
