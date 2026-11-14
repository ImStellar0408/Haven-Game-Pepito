extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if not body.is_in_group("player"):
		return
	if Global.key_map == 0:
		print("Necesitas una llave...")
		DialogueManager.show_dialogue_balloon(preload("res://Dialogos/KeyNeed.dialogue"), "start")
	elif Global.key_map == Global.correct_map:
		print("¡GANASTE! La llave era la correcta")
		get_tree().change_scene_to_file("res://victoria.tscn")
	else:
		print("Esta llave no abre esta puerta...")
		await get_tree().create_timer(1.0).timeout
		Global.bounce_back()
