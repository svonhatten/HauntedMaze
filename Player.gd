extends KinematicBody2D

# Vector2(X,Y)
var motion = Vector2.ZERO
# var direction : Vector2 = Vector2()
var starting_position

const invincibility_duration = 1.5
onready var hurtbox = $Hurtbox_Player
onready var blinker = $Blinker

func _ready():
	starting_position = get_global_position()

func _physics_process(delta):
	motion = Vector2()
	# moving right
	if Input.is_action_pressed("right"):
		motion.x = 100
		print("right pressed")
	# moving left
	elif Input.is_action_pressed("left"):
		motion.x = -100
		print("left pressed")
	else:
		motion.x = 0
		print("idle")
	# moving up
	if Input.is_action_pressed("up"):
		motion.y = -100
		print("up pressed")
	# moving down
	elif Input.is_action_pressed("down"):
		motion.y = 100
		print("down pressed")
	# no movement
	else:
		motion.y = 0
		print("idle")
		
	move_and_collide(motion*delta)

func _on_Hurtbox_Player_area_entered(area):
	pass


func _on_Hurtbox_Player_body_entered(body):
	# if the player get's hit by a ghost, the scene starts over
	# and player is sent back to start of maze
	if (body.get_name() == 'Ghost'):
		print("start over")
		if !hurtbox.is_invincible:
			print("ouch")
			blinker.start_blinking(self, invincibility_duration)
			hurtbox.start_invincibility(invincibility_duration)
		get_tree().change_scene("res://Scene.tscn")
