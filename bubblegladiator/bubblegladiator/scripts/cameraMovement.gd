extends Node3D

var mouseCameraSensitivity = 0.005
var joystickCameraSensitivity = 0.1
var twistInput = 0.0
var pitchInput = 0.0
var inputDirection

@onready var twistPivot = $h
@onready var pitchPivot = $h/v

func _physics_process(delta: float) -> void:
	# joystick
	inputDirection = Input.get_vector("look_left", "look_right", "look_up", "look_down")
	twistPivot.rotate_y(-inputDirection.x * joystickCameraSensitivity)
	twistPivot.rotate_x(-inputDirection.y * joystickCameraSensitivity)

	# mouse
	twistPivot.rotate_y(twistInput)
	pitchPivot.rotate_x(pitchInput)
	
	pitchPivot.rotation.x = clamp(
		pitchPivot.rotation.x,
		deg_to_rad(-70),
		deg_to_rad(-5)
	)
	twistInput = 0.0
	pitchInput = 0.0
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twistInput = -event.relative.x * mouseCameraSensitivity
			pitchInput = -event.relative.y * mouseCameraSensitivity
