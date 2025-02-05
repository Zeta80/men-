extends Control

@onready var master_slide: HSlider = $AudioControl/Buttons_cont/Master_slide
func _ready() -> void:
	print(db_to_linear(AudioServer.get_bus_volume_db(0)))
	#vado a caricare i salvataggi settings
	var audio_settings = ConfigFileHandler.load_audio_setting()
	#vado a settare la barra del master in base al valore salvato nel config 
	master_slide.value = min(audio_settings.master_volume, 1.0)*100
	change_value(master_slide.value, 0)
	#master_slide.value = db_to_linear(AudioServer.get_bus_volume_db(0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/scenes/main_menu.tscn")


func _on_master_slide_drag_ended(value_changed: bool) -> void:
	if value_changed:
		#se il valore è cambiato allora vado a chiamare la funzione per passare i dati da salvare
		ConfigFileHandler.save_audio_setting("master_volume", master_slide.value/100)
		change_value(master_slide.value, 0)

func _on_music_slide_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.


func _on_sfx_slide_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.
	
	#funzione per cambiare il volume bus in audio in base a dove chiami
func change_value(value: float, index: int):
	AudioServer.set_bus_volume_db(index, linear_to_db(value))
	print("funzione", db_to_linear(AudioServer.get_bus_volume_db(0)))
	return value
