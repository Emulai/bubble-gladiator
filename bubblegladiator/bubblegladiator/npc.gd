extends Node3D

var start_position = position

#collision occurs and npc has moved to new position

@export var npc_distance = position.distance_to(start_position) 
@export var distance_multiplier = npc_distance/100

		

  






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
