extends Area2D
@onready var game_manager = %GAME_MANAGER
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	if game_manager:  # Ensure game_manager is not null
		game_manager.add_point()
	else:
		print("Error: game_manager is null")
	animation_player.play("pickup")
