extends Node3D

@export var pause_menu: PackedScene
var pause_menu_instance 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print("c")
		#controllare se c'è gia il child di pause
		pause_menu_instance = pause_menu.instantiate()
		pause_menu_instance.connect("pause_delete", Callable(self, "on_pause_delete"))
		pause_menu_instance.connect("reset_level", Callable(self, "restart_game"))
		add_child(pause_menu_instance)
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
	
	
	
	
	
