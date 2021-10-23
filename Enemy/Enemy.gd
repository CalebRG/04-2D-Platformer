extends KinematicBody2D

var is_moving_left = false

var gravity =  10 # check https://www.youtube.com/watch?v=jQKxOEbbirA for more detail
var velocity = Vector2(0, 0)

var speed = 40 # pixels per secondextends KinematicBody2D
enum {MOVING, STOP}
var state = MOVING
var damage = 5
var score = 5

func _ready():
	$AnimationPlayer.play("Walk")

func _process(delta):
	move_character()
	detect_turn_around()
	
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x


func _on_PlayerDetector_body_entered(body):
	Global.update_health(-damage)

func die():
	state = STOP
	$AnimationPlayer.play("Die")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()

func _on_Area2D_body_entered(body):
	Global.update_score(score)
	$AudioStreamPlayer.play()
	die()


