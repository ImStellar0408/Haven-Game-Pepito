extends CharacterBody2D

const SPEED = 300.0


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var last_dir := "down"

func _physics_process(_delta: float) -> void:
	process_movement()
	move_and_slide()



func process_movement() -> void:
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * SPEED
	
	play_animation(direction)

func play_animation(dir: Vector2)-> void:
	if dir.x > 0:
		animated_sprite_2d.play("walk_right")
	elif dir.y < 0:
		animated_sprite_2d.play("walk_up")
	elif dir.y > 0:
		animated_sprite_2d.play("walk_down")
