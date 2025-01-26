extends RigidBody3D

var start_position = position
@export var distance_multiplier = 0
@export var npc_distance = 0

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
	if body.name == "PlayerBody3D":
		axis_lock_angular_x = false
		axis_lock_angular_z = false
		var result = body.transform.origin - transform.origin
		# Avoid negative vertical force applied so we are launching things up, not down
		result.y = abs(result.y)
		# Clamp the y force so we get nice launch angles
		if result.y < 0.35:
			result.y = 0.35
		elif result.y > 0.75:
			result.y = 0.75
		
		# If the player is charging, we want to apply more force
		if body.isCharging:
			apply_force(result * Global.game_manager.launch_physics.charged_launch_force)
		else:
			apply_force(result * Global.game_manager.launch_physics.normal_launch_force)
		
		npc_distance = position.distance_to(start_position) 
		distance_multiplier = npc_distance/100



func _on_body_exited(body: Node) -> void:
	pass # Replace with function body.
