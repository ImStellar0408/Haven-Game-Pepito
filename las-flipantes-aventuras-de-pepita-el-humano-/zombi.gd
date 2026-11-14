extends CharacterBody2D

const SPEED = 120.0
var player: Node2D

@onready var hit_zone: Area2D = $HitZone

func _ready() -> void:
	$AnimationPlayer.play("zombi_camizombi")
	player = get_tree().get_first_node_in_group("player")
	hit_zone.body_entered.connect(_on_hit_zone_body_entered)

func _physics_process(_delta: float) -> void:
	if player:
		velocity = global_position.direction_to(player.global_position) * SPEED
		move_and_slide()

func _on_hit_zone_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		Global.bounce_back()




func _on_sight_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		print("te toque")
