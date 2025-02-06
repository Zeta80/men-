extends Control

@onready var master_slide: HSlider = $AudioControl/Buttons_cont/Master_slide
@onready var music_slide: HSlider = $AudioControl/Buttons_cont/Music_slide

func _ready() -> void:
	#vado a settare la barra del master in base al valore salvato nel config 
	master_slide.value = min(OptionsHandler.audio_settings.master_volume, 1.0)*100
	music_slide.value = min(OptionsHandler.audio_settings.music_volume, 1.0)*100
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/scenes/main_menu.tscn")


func _on_master_slide_drag_ended(value_changed: bool) -> void:
	if value_changed:
		#se il valore è cambiato allora vado a chiamare la funzione per passare i dati da salvare
		ConfigFileHandler.save_audio_setting("master_volume", master_slide.value/100)
		OptionsHandler.change_audio_bus(master_slide.value, 0)

func _on_music_slide_drag_ended(value_changed: bool) -> void:
	if value_changed:
		#se il valore è cambiato allora vado a chiamare la funzione per passare i dati da salvare
		ConfigFileHandler.save_audio_setting("music_volume", music_slide.value/100)
		OptionsHandler.change_audio_bus(music_slide.value, 0)


func _on_sfx_slide_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.
	
