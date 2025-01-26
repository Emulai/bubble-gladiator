extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_pressed() -> void:
	Global.game_manager.change_ui_scene("") # Pressing start we close the main menu UI
	Global.game_manager.change_3d_scene("res://arena_scene/Arena.tscn")
	# Capture the mouse for the 3d scene
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_quit_to_menu_pressed() -> void:
	Global.game_manager.clean_up_3d_scene()
	Global.game_manager.change_ui_scene("res://main_menu/main_menu_ui.tscn")
	Global.game_manager.change_3d_scene("")


func _on_quit_game_pressed() -> void:
	get_tree().quit()
