extends CharacterBody3D

@onready var rigidBody: RigidBody3D = $"../RigidBody3D"

func _ready() -> void:
	rigidBody.process_mode = Node.PROCESS_MODE_DISABLED
	#process_mode = PROCESS_MODE_DISABLED

func _physics_process(delta: float) -> void:
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider().name == "PlayerBody3D":
			print("collided with player")
			rigidBody.process_mode = Node.PROCESS_MODE_ALWAYS
			rigidBody.apply_force(Vector3(0, 100000, 0))
			process_mode = PROCESS_MODE_DISABLED
