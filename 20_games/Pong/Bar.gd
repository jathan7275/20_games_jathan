extends CharacterBody2D

#Determining what controls will be used
@export_group("Player number")
@export_range(1,2) var playernumber = 1
const SPEED = 200.0
#Disables AI if a player makes a input
var playerimput: bool = false
#variable to disable the bar being "nudged" by the ball 
var xlock = null


func _ready():
	#mesures the x pos of the bar
	xlock = global_position.x 
func _physics_process(delta):
	
	#converts the player number int string, have the project coded ans 1up and 2up in setting
	var direction = Input.get_axis(str(playernumber)+"up", str(playernumber)+"down")
		
	
	if direction:
		#I know it's bad practce to keep on resetting the same bool but it wont affect such a small game
		playerimput = true
		
	velocity.y = direction * SPEED * delta
	#velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_collide(velocity)
	global_position.x = xlock
