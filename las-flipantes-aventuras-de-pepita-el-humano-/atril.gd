extends Area2D


@export var atril_num = 0
var player_near = false
var selected = false


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
	if player_near and not selected and event.is_action_pressed("interact"):
		select_this()

func select_this() -> void:
	selected = true
	Global.atril_selected = atril_num
	print("mapa seleccionado", atril_num)
