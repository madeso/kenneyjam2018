extends Control

signal quit_clicked
signal continue_clicked

func _ready():
	pass


func _on_ContinueButton_pressed():
	emit_signal("continue_clicked")


func _on_QuitButton_pressed():
	emit_signal("quit_clicked")
