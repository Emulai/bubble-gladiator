class_name GameManager extends Node

@export var scenes_3d: Node3D
@export var scenes_ui: Control

var current_3d_scene
var current_ui_scene

# Track whether a scene is paused or not
var paused = false

# Track the time limit
var timeLimit = 10
var oneSecond = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.game_manager = self
	current_ui_scene = $UI_Scenes/MainMenuUI
	current_3d_scene = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Just checking we're in a 3d scene before counting time
	if current_3d_scene != null:
		oneSecond += delta;
	
		if oneSecond > 1:
			timeLimit -= 1
			oneSecond = 0
	
		if has_time_run_out():
			clean_up_3d_scene()
			change_3d_scene("")
			# We should change to some kind of game over scene, not just
			# straight back to the main menu.
			change_ui_scene("res://main_menu/main_menu_ui.tscn")
	
	if Input.is_action_just_pressed("pause"):
		pause_menu()

func clean_up_3d_scene() -> void:
	# Perform clean up for exiting a 3d scene, e.g. reset timer, unpause, etc
	timeLimit = 10
	oneSecond = 0
	paused = false
	Engine.time_scale = 1

func pause_menu():
	if paused:
		change_ui_scene("")
		Engine.time_scale = 1
	else:
		change_ui_scene("res://pause_menu/pause_menu_ui.tscn")
		toggle_current_ui_scene_visible(true)
		Engine.time_scale = 0
	
	paused = !paused


func toggle_current_ui_scene_visible(visible: bool) -> void:
	current_ui_scene.visible = visible

func has_time_run_out() -> bool:
	return timeLimit == 0

func get_time_limit() -> int:
	return timeLimit

func change_ui_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_ui_scene != null:
		if delete:
			current_ui_scene.queue_free() # Removes node entirely
		elif keep_running:
			current_ui_scene.visible = false # Keeps in memory and running
		else:
			scenes_ui.remove_child(current_ui_scene) # Keeps in memory, does not run
	
	if !new_scene.is_empty():
		var new = load(new_scene).instantiate()
		scenes_ui.add_child(new)
		current_ui_scene = new
	else:
		current_ui_scene = null

func change_3d_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_3d_scene != null:
		if delete:
			current_3d_scene.queue_free() # Removes node entirely
		elif keep_running:
			current_3d_scene.visible = false # Keeps in memory and running
		else:
			scenes_3d.remove_child(current_3d_scene) # Keeps in memory, does not run
	
	if !new_scene.is_empty():
		var new = load(new_scene).instantiate()
		scenes_3d.add_child(new)
		current_3d_scene = new
	else:
		current_3d_scene = null
