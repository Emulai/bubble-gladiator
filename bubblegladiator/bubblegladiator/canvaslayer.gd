extends CanvasLayer


var currentscore = 0
#var distance = 0

#need to connect signal 
#func _on_body_entered(body):
	#if body.name == "hazard":
		#var scoreAdd = $hazard.scorevalue
		#scoreAdd = scoreAdd*distance 
		#currentscore += scoreAdd
		#update_score(currentscore)


func update_score(currentscore):
	$Score.text = str(currentscore)
	









# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
