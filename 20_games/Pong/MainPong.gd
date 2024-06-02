extends Node2D


@export var ballscene: PackedScene
var paused := true
var ball_direction = 1
var score_right = 0
var score_left  = 0
func _ready():
	pass


func _input(event):
	if event is InputEventKey and paused:
		if event.pressed:
			startround(ball_direction)

func startround(direction):
	var ball = ballscene.instantiate()
	ball.position = $BallSpawn.position
	ball.startdirection = direction
	add_child(ball)
	ball.connect("score", score)
	%Indicator.hide()
	paused = false
	if  not %ScoreLeft.text.is_valid_int():
		%ScoreLeft.text = "0"
		%ScoreRight.text = "0"

func score(direction):
	$BallSpawn/AudioStreamPlayer2D.play()
	match direction:
		-1:
			score_right += 1
			%Indicator.show()
			%Indicator.text = "right wins\n press any button"
			%ScoreRight.text = str(score_right)
			ball_direction = 1
		1:
			score_left += 1
			%Indicator.show()
			%Indicator.text = "left wins\n press any button"
			%ScoreLeft.text = str(score_left)
			ball_direction = -1
	direction = ball_direction
	paused = true
func test():
	print("test has passed")
