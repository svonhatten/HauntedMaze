extends Path2D


func _physics_process(delta):
	$PathFollow2D.set_offset($PathFollow2D.get_offset()+150*delta)
