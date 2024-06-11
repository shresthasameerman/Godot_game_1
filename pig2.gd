extends Node2D

const SPEED = 220
var direction = -1

@onready var ray_cast_right = $"RayCast right"
@onready var ray_cast_left = $"RayCast left"
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	ray_cast_right.enabled = true
	ray_cast_left.enabled = true

func _process(delta):
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	elif ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
	
	# Debugging information
	print("Direction: ", direction)
	print("Left RayCast colliding: ", ray_cast_left.is_colliding())
	print("Right RayCast colliding: ", ray_cast_right.is_colliding())
	print("Position: ", position)
