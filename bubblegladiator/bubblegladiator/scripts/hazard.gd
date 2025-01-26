extends Node

@export var hazardMult = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Hazard")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
