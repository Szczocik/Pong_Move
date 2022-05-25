extends KinematicBody2D

var speed = 400
var justwarped = false



func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	move_and_slide(velocity * speed)
	
	
func process_mouse():
	var target = get_viewport().get_mouse_position().x
	var paddle_width = get_node("CollisionShape2D").shape.extents.x
	var viewport_width = get_viewport().size.x
	if position.x < target:
		pass
	
#func update_movement():
#	look_at(get_global_mouse_position())
#	var velocity = Vector2.ZERO
#	if Input.is_action_pressed(("move_left")) and not Input.is_action_pressed(("move_right")):
#		 velocity.x -= 1 
#	if Input.is_action_pressed(("move_right")) and not Input.is_action_pressed(("move_left")):
#		 velocity.x += 1 
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			justwarped = event.pressed

	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			justwarped = false




#		if !justwarped:
#			self.translate(event.relative)
#		else:
#			justwarped = false
