extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VideoPlayer_finished():
	var _target = get_tree().change_scene("res://2ndlevel.tscn")
	


func _on_Button_pressed():
	var _target = get_tree().change_scene("res://2ndlevel.tscn")