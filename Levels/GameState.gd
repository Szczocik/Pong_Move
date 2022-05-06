extends Node



var PlayerScore = 8

func _ready():
	add_to_group("Gamestate")
	update_GUI()
	

func _on_Bottom_body_entered(body):
	$Ball.position = Vector2(300,512)
	PlayerScore -= 1
	update_GUI()
	if PlayerScore <= 0:
		game_over()
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()

func _on_Top_body_entered(body):
	$Ball.position = Vector2(300,512)
	PlayerScore += 1
	update_GUI()
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	if PlayerScore > 4:
		get_tree().call_group("BallGroup","speed_ball")
		update_GUI()
	
	if PlayerScore >= 10:
		get_tree().change_scene("res://Levels/Level_End.tscn")
		update_GUI() 

func coin_up():
	PlayerScore += 1
	update_GUI()


func update_GUI():
	get_tree().call_group("GUI", "update_GUI", PlayerScore)


func _process(delta):
	#$PlayerScore.text = str(PlayerScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) +1)


func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup","restart_ball")
	$CountdownLabel.visible = false


func game_over():
	get_tree().change_scene("res://Levels/Game_over.tscn")
