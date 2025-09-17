class_name Text
extends Control

var pressed := 0

func _ready():
	load_pressed()
	update_label()
	print(ProjectSettings.globalize_path("res://"))

func save_pressed():
	var file = FileAccess.open("user://save_data.json", FileAccess.WRITE)
	if file:
		var data = {"pressed": pressed}
		file.store_string(JSON.stringify(data))
		file.close()
		
func _on_confirmation_dialog_confirmed() -> void:
	var file = FileAccess.open("user://save_data.json", FileAccess.WRITE)
	if file:
		var data = {"pressed": 0}
		file.store_string(JSON.stringify(data))
		file.close()
		load_pressed()
		update_label()

func load_pressed():
	if FileAccess.file_exists("user://save_data.json"):
		var file = FileAccess.open("user://save_data.json", FileAccess.READ)
		if file:
			var content = file.get_as_text()
			var data = JSON.parse_string(content)
			if typeof(data) == TYPE_DICTIONARY and data.has("pressed"):
				pressed = data["pressed"]
			file.close()

func update_label():
	var pressed_str := str(pressed)
	var zeros := ""

	if pressed_str.length() == 1:
		zeros = "0000"
	elif pressed_str.length() == 2:
		zeros = "000"
	elif pressed_str.length() == 3:
		zeros = "00"
	elif pressed_str.length() == 4:
		zeros = "0"
	else:
		zeros = ""

	$Panel/Label.text = zeros + pressed_str

func _on_button_button_down() -> void:
	pressed += 1
	save_pressed()
	update_label()
