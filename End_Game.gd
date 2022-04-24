extends Area2D

func _on_End_Game_Collision_body_entered(body):
	if (body.get_name() == 'Player'):
		get_tree().quit()
	
	


func _on_End_Game_Collision_area_entered(area):
	# get_tree().quit()
	pass
