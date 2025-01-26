extends Panel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Timer.text = str(Global.game_manager.get_time_limit())
