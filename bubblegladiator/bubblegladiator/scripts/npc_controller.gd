extends RigidBody3D

func _ready() -> void:
	pass
	#process_mode = PROCESS_MODE_DISABLED

#func _physics_process(delta: float) -> void:
	#move_and_slide()
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#
		#if collision.get_collider().name == "PlayerBody3D":
			#print("collided with player")
			#axis_lock_angular_x = false
			#axis_lock_angular_z = false


func _on_body_entered(body: Node):
	print("test")
	if body.name == "PlayerBody3D":
		axis_lock_angular_x = false
		axis_lock_angular_z = false
		print(body.transform)
		var result = body.transform.origin - transform.origin
		# Avoid negative vertical force applied so we are launching things up, not down
		result.y = abs(result.y)
		# Clamp the y force so we get nice launch angles
		if result.y < 0.35:
			result.y = 0.35
		elif result.y > 0.6:
			result.y = 0.6
		# possibly do a check here for whether the player was charging or not
		# and use appropriate force multiplier
		if true:
			apply_force(result * Global.game_manager.launch_physics.normal_launch_force)
		else:
			apply_force(result * Global.game_manager.launch_physics.charged_launch_force)
		
		npc_distance = position.distance_to(start_position) 
		distance_multiplier = npc_distance/100
		
	# TODO
	# Add realistic mass to objects
	# Tweak force to feel like a good throw (clamp a min y so there is always up force and clamp max y)
	# We want the launch force to be dependent on whether player is charging or not


func _on_body_exited(body: Node) -> void:
	pass # Replace with function body.
