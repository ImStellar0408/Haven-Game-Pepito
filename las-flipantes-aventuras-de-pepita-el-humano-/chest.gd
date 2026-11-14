extends Area2D

@export var map_id := 1

var opened := false
var player_near := false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	Global.current_map = map_id
	sprite.play("default")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_near = true

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_near = false

func _unhandled_input(event: InputEvent) -> void:
	if player_near and not opened and event.is_action_pressed("interact"):
		open_chest()

func open_chest() -> void:
	opened = true
	Global.key_map = map_id
	print("Llave obtenida del mapa ", map_id)
	sprite.play("opener")
