extends KinematicBody2D

var VP := Vector2.ZERO
var velocity := Vector2.ZERO
export var acceleration := 0.1
var rotation_accel := 0.075
var max_speed := 10

var push := 400
var reflect := 2

var Bullet = preload("res://Bullet/Bullet.tscn")
var Bullets = null

var Explosion = preload("res://Explosion/Explosion_ship.tscn")
var Explosions = null

func _ready():
	VP = get_viewport().size

func _physics_process(_delta):
	rotation += get_rotation()*rotation_accel
	velocity += get_input()*acceleration
	velocity = velocity.normalized() * clamp(velocity.length(),0,max_speed)
	var collision = move_and_collide(velocity,false)

func die():
	if Global.has_method("update_health"):
		Global.update_health(-10)

func get_input():
	var toReturn := Vector2.ZERO
	if Input.is_action_pressed("jump"):
		toReturn.y -= 1
		$Thrust.show()
	else:
		$Thrust.hide()
	return toReturn.rotated(rotation)

func get_rotation():
	var toReturn := 0.0
	if Input.is_action_pressed("right"):
		toReturn += 1.0
	if Input.is_action_pressed("left"):
		toReturn -= 1.0
	return toReturn
