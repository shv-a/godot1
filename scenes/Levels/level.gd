extends Node2D

var postril_scene: PackedScene = preload("res://scenes/projectiles/postril.tscn")


func _on_player_postril(pos, direction):
	create_postril(pos, direction)

func create_postril(pos, direction):
	var postril = postril_scene.instantiate() as Area2D
	postril.position = pos
	postril.rotation_degrees = rad_to_deg(direction.angle())
	postril.direction = direction
	add_child(postril)


func _on_pidpyvas_1_postril(pos, direction):
	create_postril(pos, direction)
