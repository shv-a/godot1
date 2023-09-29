extends CharacterBody2D

signal postril(pos, direction)

var can_postril: bool = true

@export var max_speed: int = 500
var speed: int = max_speed

func hit():
	print("gabela")

func _process(_delta):
	
	# input 
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * max_speed
	move_and_slide()
	
	# rotate 
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_postril:
		var postril_markers = $PostrilStartPositions.get_children()
		var selected_postril = postril_markers[randi() % postril_markers.size()]
		can_postril = false
		$Timer.start()
		postril.emit(selected_postril.global_position, player_direction)

func _on_timer_timeout():
	can_postril = true
