extends KinematicBody2D

# Vector2(X,Y)
var motion = Vector2.ZERO
# var direction : Vector2 = Vector2()

func _physics_process(delta):
	motion = Vector2()
	# moving right
	if Input.is_action_pressed("right"):
#		motion.x = 100
		motion.x = 100
#		position.x += 20
		# direction = Vector2(100, 0)
		print("right pressed")
	# moving left
	elif Input.is_action_pressed("left"):
#		motion.x = -100
		motion.x = -100
#		position.x += -20
		# direction = Vector2(-100,0)
		print("left pressed")
	else:
		motion.x = 0
		print("idle")
	# moving up
	if Input.is_action_pressed("up"):
#		motion.y = -100
		motion.y = -100
#		position.y += -20
		# direction = Vector2(0,-100)
		print("up pressed")
	# moving down
	elif Input.is_action_pressed("down"):
#		motion.y = 100
		motion.y = 100
#		position.y += 20
		# direction = Vector2(0,100)
		print("down pressed")
	# no movement
	else:
		motion.y = 0
		print("idle")
		
#	print(position)
	# motion = move_and_slide(motion)
#	move_and_collide(position)
	move_and_collide(motion*delta)

func old(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	# if input_vector != Vector2.ZERO:
		# motion = motion.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	# else:
		# motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)
	
	print(motion)
	motion = move_and_slide(motion)
