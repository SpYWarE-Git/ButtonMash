class_name SpriteButton
extends Sprite2D

@export var pressedb = "res://Assets/pressedb.png"
@export var npressedb = "res://Assets/npressedb.png"

func _on_button_button_down() -> void:
	texture = load(pressedb)


func _on_button_button_up() -> void:
	texture = load(npressedb)
