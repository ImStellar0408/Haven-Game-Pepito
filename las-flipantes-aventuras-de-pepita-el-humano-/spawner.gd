extends Node2D
@export var enemy_scene: PackedScene
@onready var timer: Timer = $Timer


func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position = position
	get_parent().add_child(enemy)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.is_in_group("player"):
			timer.start()


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
