extends CharacterBody2D


const SPEED = 300.0
@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	set_motion_mode(CharacterBody2D.MOTION_MODE_FLOATING)

func _process(_delta):
	# Play the correct animation
	if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		animated_sprite.set_frame(0)
	
	if Input.is_action_pressed("down") and Input.is_action_pressed("left"):
		animated_sprite.flip_h = false
		animated_sprite.play("runDownLeft")
	elif Input.is_action_pressed("down") and Input.is_action_pressed("right"):
		animated_sprite.flip_h = true
		animated_sprite.play("runDownLeft")
	elif Input.is_action_pressed("up") and Input.is_action_pressed("left"):
		animated_sprite.flip_h = false
		animated_sprite.play("runUpLeft")
	elif Input.is_action_pressed("up") and Input.is_action_pressed("right"):
		animated_sprite.flip_h = true
		animated_sprite.play("runUpLeft")
	elif Input.is_action_pressed("up"):
		animated_sprite.flip_h = false
		animated_sprite.play("runUp")
	elif Input.is_action_pressed("down"):
		animated_sprite.flip_h = false
		animated_sprite.play("runDown")
	elif Input.is_action_pressed("left"):
		animated_sprite.flip_h = false
		animated_sprite.play("runLeft")
	elif Input.is_action_pressed("right"):
		animated_sprite.flip_h = true
		animated_sprite.play("runLeft")
	else:
		animated_sprite.stop()
		animated_sprite.set_frame(1)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("left","right","up","down")
	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction.y:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	

	move_and_slide()
