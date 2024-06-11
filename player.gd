extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

# Variables for double jump
var can_double_jump = false
var double_jump_used = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			double_jump_used = false  # Reset double jump usage when on the floor
		elif not double_jump_used:
			velocity.y = JUMP_VELOCITY
			double_jump_used = true   # Mark double jump as used

	# gets the movement direction: -1 , 0 , 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# flip the sprite:
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# animation play
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# applies the movement 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# Reset double jump state when on the floor
	if is_on_floor():
		can_double_jump = true
