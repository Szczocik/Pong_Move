extends Node

var PlayerScore = 0
var OpponentScore = 0



func _on_Bottom_body_entered(body):
	$Ball.position = Vector2(300,512)
	OpponentScore += 1
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true

func _on_Top_body_entered(body):
	$Ball.position = Vector2(300,512)
	PlayerScore += 1
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)


func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup","restart_ball")
	$CountdownLabel.visible = false
