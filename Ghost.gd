extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Hitbox_Ghost_area_entered(area):
	pass # Replace with function body.


func _on_Hitbox_Ghost_body_entered(body):
	# if the ghost hits the player, the game starts back
	# at the start of the maze
	if (body.get_name() == 'Player'):
		print("start over")
		get_tree().change_scene("res://Scene.tscn")
