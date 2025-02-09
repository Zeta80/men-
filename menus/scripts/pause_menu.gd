extends Control

signal pause_delete
signal reset_level
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_resume_pressed() -> void:
	pause_delete.emit()


func _on_button_reset_pressed() -> void:
	reset_level.emit()
	
	
	
func _on_button_options_pressed() -> void:
	pass # Replace with function body.


func _on_button_exit_pressed() -> void:
	pass # Replace with function body.
