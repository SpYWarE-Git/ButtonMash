class_name ConfirmReset
extends ConfirmationDialog

func _ready() -> void:
	visible = false

func _on_confirmed() -> void:
	visible = false

func _on_canceled() -> void:
	visible = false


func _on_reset_pressed() -> void:
	visible = true
	popup_centered()
