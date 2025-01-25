extends Control

@onready var main = $"../"

func _on_resume_pressed() -> void:
	Global.game_manager.pause_menu()


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_to_menu_pressed() -> void:
	Global.game_manager.clean_up_3d_scene()
	Global.game_manager.change_ui_scene("res://main_menu/main_menu_ui.tscn")
	Global.game_manager.change_3d_scene("")


func _on_quit_game_pressed() -> void:
	get_tree().quit()
