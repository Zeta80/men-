extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_start_pressed() -> void:
	#get_tree().change_scene_to_file("")
	pass


func _on_button_options_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/scenes/option_menu.tscn")


func _on_button_exit_pressed() -> void:
	get_tree().quit()
