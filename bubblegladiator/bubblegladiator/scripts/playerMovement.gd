extends CharacterBody3D

var speed = 10.0
var turnSpeed = 30
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var parent
var isCharging = false

@onready var cameraH = $"../CameraPosition/h"
@onready var cameraV = $"../CameraPosition/h/v"
@onready var anims: AnimationPlayer = $AnimTest/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parent.position = position
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("charge"):
		isCharging = true
	elif event.is_action_released("charge"):
		isCharging = false
	
func _physics_process(delta: float) -> void:
	var inputDir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	updateMoveAnimation(inputDir)
	
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

func updateMoveAnimation(inputVector: Vector2):
	if inputVector == Vector2.ZERO:
		changeAnimIfNotActive("Idle")
	elif isCharging:
		changeAnimIfNotActive("Charge")
	else:
		changeAnimIfNotActive("Run")
		
func changeAnimIfNotActive(anim: String):
	var animName = "Player/" + anim
	if not anims.current_animation == animName:
		anims.play(animName)
