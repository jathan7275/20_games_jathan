extends RigidBody2D

signal score #-1 for left +1 for right
@export var speed = 500
#have to do it this way because there is no move_and_slide in RigiBody2D
var velocity = Vector2.ZERO 

#used to change the direction the ball goes -1 for left and 1 for right
var startdirection = 1
#needed for velocity adding, as using 2 "Vector2"'s isn't allowed
var xvec = Vector2.RIGHT
var yvec = Vector2.UP
 
#1st initiatn
func _ready():
	
	velocity = Vector2( 1.0 , randf()) * speed * startdirection
	velocity += Vector2.UP * randf()
	set_axis_velocity(velocity)


#just used to make beeping noise on contact
func _on_body_entered(_body):
		%Beep.pitch_scale = randf_range(.5, 1)
		%Beep.play()
	

#emits 2 signals depending on which side the ball leaves
func _on_visible_on_screen_notifier_2d_screen_exited():
	if global_position.x > 0:
		score.emit(1)
		#print("score right")
	else:
		score.emit(-1)
		#print("score left")
	
	queue_free()
