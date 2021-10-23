extends Area2D

var score = 10

func _ready():
	$AnimationPlayer.play("coinspin")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Global.update_score(score)
		$AudioStreamPlayer.play()
		queue_free()
