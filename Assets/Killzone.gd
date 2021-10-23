extends Node2D

var respawn
onready var Player = load("res://Player/Player.tscn")

func _ready():
	respawn = get_node("Respawn").get_global_position()
	
func _on_Killzone_body_entered(body):
	if body.name == "Player":
		body.position = respawn
