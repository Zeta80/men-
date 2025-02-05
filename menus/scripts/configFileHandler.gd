extends Node

var config = ConfigFile.new()
const SETTING_FILE_PATH = "user://settings.ini"

func _ready() -> void:
	if !FileAccess.file_exists(SETTING_FILE_PATH):
		config.set_value("audio", "master_volume", 1.0)
		config.save(SETTING_FILE_PATH)
	else:
		config.load(SETTING_FILE_PATH)
		

func save_audio_setting(key: String, value):
	config.set_value("audio", key, value)
	config.save(SETTING_FILE_PATH)

func load_audio_setting():
	var audio_settings = {}
	for key in config.get_section_keys("audio"):
		audio_settings[key] = config.get_value("audio", key)
	return audio_settings
