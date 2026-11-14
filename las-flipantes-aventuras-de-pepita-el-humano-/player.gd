extends CharacterBody2D

const SPEED = 300.0
var last_direction: Vector2 = Vector2.RIGHT
var max_health: int = 100
var health: int = 100
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var last_dir := "down"



func _physics_process(_delta: float) -> void:
	process_movement()
	move_and_slide()

func _ready() -> void:
	$AnimationPlayer.play("pepito camipito")

func process_movement() -> void:
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		last_direction = direction
	else:
		velocity = Vector2.ZERO 
	
	process_animation(last_direction)
	
func process_animation(direction) -> void:
	if velocity != Vector2.ZERO:
		play_animation("walk", direction)
	else:
		play_animation("idle", direction)

func play_animation(prefix: String, dir: Vector2)-> void:
	if dir.x > 0:
		animated_sprite_2d.play(prefix + "_right")
	elif dir.y < 0:
		animated_sprite_2d.play(prefix +"_up")
	elif dir.y > 0:
		animated_sprite_2d.play(prefix +"_down")
	elif dir.x < 0:
		animated_sprite_2d.play(prefix +"_left")
		
func take_damege(amount: int) -> void:
	health -= amount
	print(health)


func die() -> void:
	set_physics_process(false)
	animated_sprite_2d.play("die")
	await $AnimatedSprite2D.animation_finished
	Global.bounce_back()
