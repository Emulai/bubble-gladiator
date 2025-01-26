extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	Global.game_manager.change_ui_scene("") # Pressing start we close the main menu UI
	Global.game_manager.change_3d_scene("res://arena_scene/Arena.tscn")
	# Capture the mouse for the 3d scene
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
