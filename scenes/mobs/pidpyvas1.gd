extends CharacterBody2D

var can_postril: bool = true

signal postril(pos, direction)

func hit():
	$Timers/DeathEffect.start()
	$MobPicture.visible = false
	$Explosion.visible = true
	

func _process(_delta):

		look_at(Vector2(0, 0))#Globals.player_pos
		if can_postril:
			var marker_node = $PostrilStartPositions.get_child(0)
			var pos: Vector2 = marker_node.global_position
			var direction: Vector2 = (Vector2(0, 0) - position).normalized()#Globals.player_pos
			postril.emit(pos, direction)
			can_postril = false
			$Timers/Attack.start()

func _on_attack_timeout():
	can_postril = true

func _on_death_effect_timeout():
	queue_free()
