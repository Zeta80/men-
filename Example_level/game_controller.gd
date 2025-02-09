extends Node3D

@export var pause_menu: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print("c")
		var pause_menu_instance = pause_menu.instantiate()
		add_child(pause_menu_instance)
