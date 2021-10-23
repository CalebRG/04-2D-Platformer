extends Node2D



func _on_transition_body_entered(body):
	var _target = get_tree().change_scene("res://2c.tscn")
