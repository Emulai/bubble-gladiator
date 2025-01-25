extends Control

@onready var main = $"../"

func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/main_menu_ui.tscn")


func _on_quit_game_pressed() -> void:
	get_tree().quit()
