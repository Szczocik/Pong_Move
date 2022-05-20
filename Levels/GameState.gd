extends Node

const CLOUD = preload("res://Items/Cloud.tscn")

var PlayerScore = 3



func _ready():
	add_to_group("Gamestate")
	update_GUI()
	

func _on_Bottom_body_entered(body):
	$Ball.position = Vector2(960,540)
	PlayerScore -= 1
	update_GUI()
	if PlayerScore <= 0:
		game_over()
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()

func _on_Top_body_entered(body):
	$Ball.position = Vector2(960,540)
	PlayerScore += 1
	update_GUI()
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	if PlayerScore > 7:
		get_tree().call_group("BallGroup","speed_ball")
		update_GUI()
	
	if PlayerScore == 10:
		update_GUI()
		change_scene()
		
		
	if PlayerScore == 20:
		update_GUI()
		game_over()
		
func cloud_spawn(start_pos):
	var cloud = CLOUD.instance()
	var cloud_start_node_name = "StartPositions/CloudStart" + str(start_pos)
	cloud.position = get_node(cloud_start_node_name).position
	add_child(cloud)
	
	var timer_node_name = "CloudTimer/Timer" + str(start_pos)
	get_node(timer_node_name).wait_time = rand_range(10,10)
	update_GUI()


func coin_up():
	PlayerScore += 1
	update_GUI()
	
	
func coin_down():
	PlayerScore -= 2
	update_GUI()
	
	
func portal_up():
	PlayerScore += 2
	update_GUI()
	get_tree().call_group("BallGroup","stop_ball")
	$Ball.visible = false
	$Ball.position = Vector2(960,540)
	$Ball.visible = true
	get_tree().call_group("BallGroup","restart_ball")
	_on_CountdownTimer_timeout()
	
	
func change_scene():
	get_tree().change_scene("res://Levels/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")


func update_GUI():
	get_tree().call_group("GUI", "update_GUI", PlayerScore)


func _process(delta):
	$CountdownLabel.text = str(int($CountdownTimer.time_left) +1)
	

func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup","restart_ball")
	$CountdownLabel.visible = false


func game_over():
	get_tree().change_scene("res://Levels/Game_over.tscn")


func _on_Timer1_timeout(): cloud_spawn(1)
func _on_Timer2_timeout(): cloud_spawn(2)
func _on_Timer3_timeout(): cloud_spawn(3)
