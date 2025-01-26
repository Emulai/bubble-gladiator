extends CharacterBody3D

var speed = 10.0
var turnSpeed = 30
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var parent

@onready var cameraH = $"../CameraPosition/h"
@onready var cameraV = $"../CameraPosition/h/v"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parent.position = position
	
func _physics_process(delta: float) -> void:
	var inputDir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (cameraH.transform.basis * Vector3(inputDir.x, 0, inputDir.y))
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		rotation.y = lerp_angle(rotation.y, atan2(-direction.x, -direction.z), turnSpeed * delta)
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	move_and_slide()
