extends PathFollow2D


func _physics_process(delta):
	# moving right
	if Input.is_action_pressed("ui_right"):
		$PlayerFollow.offset += 100
	# moving left
	elif Input.is_action_pressed("ui_left"):
		$PlayerFollow.offset += -100
	# moving up
	elif Input.is_action_pressed("ui_up"):
		$PlayerFollow.offset += -100
	# moving down
	elif Input.is_action_pressed("ui_down"):
		$PlayerFollow.offset += 100
	# when no keys are being pressed (want the player character to stop moving)
	
	
	
