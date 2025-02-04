extends Control

@onready var master_slide: HSlider = $AudioControl/Buttons_cont/Master_slide
func _ready() -> void:
	print(db_to_linear(AudioServer.get_bus_volume_db(0)))
	master_slide.value = db_to_linear(AudioServer.get_bus_volume_db(0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/scenes/main_menu.tscn")


func _on_master_slide_drag_ended(value_changed: bool) -> void:
	if value_changed:
		AudioServer.set_bus_volume_db(0, linear_to_db(master_slide.value))
		print("funzione", db_to_linear(AudioServer.get_bus_volume_db(0)))


func _on_music_slide_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.


func _on_sfx_slide_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.
