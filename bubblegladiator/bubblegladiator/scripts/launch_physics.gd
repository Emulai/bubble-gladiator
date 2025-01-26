class_name LaunchPhysics extends Node

var normal_launch_force = 1000
var charged_launch_force = 10000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_normal_launch_force() -> int:
	return normal_launch_force

func get_charged_launch_force() -> int:
	return charged_launch_force
