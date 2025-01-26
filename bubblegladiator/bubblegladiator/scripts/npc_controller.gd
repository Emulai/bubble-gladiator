extends RigidBody3D

var start_position: Vector3
@export var pointValue = 10
var isLanded = true
var hasCollidedWithHazard = false

func _ready() -> void:
	pass

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
		
		start_position = position
		isLanded = false

	elif body.name == "Floor" and not isLanded:
		isLanded = true
		var landingPosition = position
		var distance = ceil(start_position.distance_to(landingPosition))
		var totalPoints = pointValue * distance
		var reason = name + " thrown " + str(distance) + "ms for " + str(totalPoints) + " points!"
		Global.game_manager.add_to_score(pointValue * distance, reason)

	elif body.is_in_group("Hazard") and not hasCollidedWithHazard:
		hasCollidedWithHazard = true
		var totalPoints = pointValue * body.hazardMult
		var reason = name + " thrown into " + body.name + " for " + str(totalPoints) + " points!"
		Global.game_manager.add_to_score(pointValue * body.hazardMult, reason)
	
func _on_body_exited(body: Node) -> void:
	pass # Replace with function body.
