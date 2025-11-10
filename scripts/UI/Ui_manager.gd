class_name UIManager

extends CanvasLayer

@onready var end_button_parent : Control = $ButtonContainer

func display_end_buttons(display: bool):
	end_button_parent.visible= display


func _on_restart_pressed() -> void:
	GameManager.restart()


func _on_quit_pressed() -> void:
	get_tree().quit()
