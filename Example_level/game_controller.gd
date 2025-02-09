extends Node3D

@export var pause_menu: PackedScene
var pause_menu_instance 
var pause_already_pressed := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if pause_already_pressed:
		pause_game(false)
		pause_already_pressed = false
	elif event.is_action_pressed("pause"):
		print("c")
		#controllare se c'è gia il child di pause
		pause_menu_instance = pause_menu.instantiate()
		pause_menu_instance.connect("pause_delete", Callable(self, "on_pause_delete"))
		pause_menu_instance.connect("reset_level", Callable(self, "restart_game"))
		pause_menu_instance.connect("options", Callable(self, "option_game"))
		pause_menu_instance.connect("main_menu", Callable(self, "main_menu_game"))
		add_child(pause_menu_instance)
		pause_already_pressed = true
		pause_game(true)
		

func on_pause_delete():
	print("funzioone")
	remove_child(pause_menu_instance)
	pause_game(false)
	
func pause_game(value: bool) -> void:
	get_tree().paused = value
	
func restart_game() -> void:
	pause_game(false)
	get_tree().reload_current_scene()
	
func option_game() -> void:
	pause_game(false)
	get_tree().change_scene_to_file("res://menus/scenes/option_menu.tscn")
	
func main_menu_game() -> void:
	pause_game(false)
	get_tree().change_scene_to_file("res://menus/scenes/main_menu.tscn")
	
	
