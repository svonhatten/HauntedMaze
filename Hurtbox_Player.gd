extends Area2D

# code inspiration: youtube.com/watch?v=tHEr7x5Un9c&ab_channel=BitBirdy

const whiten_duration = 0.15
export (ShaderMaterial) var whiten_material
onready var collision_shape = $CollisionShape2D

var is_invincible = false

func start_invincibility(invincibility_duration):
	is_invincible = true
	collision_shape.set_deferred("disabled", true)
	yield(get_tree().create_timer(invincibility_duration), "timeout")
	collision_shape.set_deferred("disabled", false)
	is_invincible = false


func _on_Hurtbox_Player_area_entered(area):
	# when player is hurt, shader will be set to the whitened shader for .15 sec
	# before going back to normal
	# whiten_material.set_shader_param("whiten", true)
	# yield(get_tree().create_timer(whiten_duration), "timeout")
	# whiten_material.set_shader_param("whiten", false)
	pass


func _on_Hurtbox_Player_body_entered(body):
	# when player is hurt, shader will be set to the whitened shader for .15 sec
	# before going back to normal
	if (body.get_name() == 'Ghost'):
		whiten_material.set_shader_param("whiten", true)
		yield(get_tree().create_timer(whiten_duration), "timeout")
		whiten_material.set_shader_param("whiten", false)
