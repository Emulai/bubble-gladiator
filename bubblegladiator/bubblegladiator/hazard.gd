extends Node3D

@export var scorevalue = 100

func _on_body_entered(body):
	if body.name == "npc":
		scorevalue = scorevalue*$canvaslayer.distance 
		$canvaslayer.currentscore += scorevalue
		$canvaslayer.update_score($canvaslayer.currentscore)








# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
