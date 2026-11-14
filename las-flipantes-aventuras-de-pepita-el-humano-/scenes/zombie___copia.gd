extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta: float) -> void:


	move_and_slide()





func _on_sight_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("player")
