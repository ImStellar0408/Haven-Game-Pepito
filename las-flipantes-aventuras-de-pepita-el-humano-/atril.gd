extends Area2D

const dialogo = preload("res://Dialogos/balloon.tscn")

@export var atril_num = 0
var player_near = false
var selected = false
var has_map = Global.habemus_map


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_near = true

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_near = false

func _unhandled_input(event: InputEvent) -> void:
	if player_near and not selected and event.is_action_pressed("interact") and not Global.habemus_map:
		DialogueManager.show_dialogue_balloon(preload("res://Dialogos/Atril.dialogue"), "start")
		Global.habemus_map = true
		select_this()
	elif player_near and selected and event.is_action_pressed("interact") and Global.habemus_map:
		DialogueManager.show_dialogue_balloon(preload("res://Dialogos/Atril_Error.dialogue"), "start")

func select_this() -> void:
	selected = true
	Global.atril_selected = atril_num
	print("mapa seleccionado", atril_num)
