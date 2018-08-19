extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Interface.hide()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if $Interface.visible:
			$Interface.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Interface.show()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Interface_continue_clicked():
	$Interface.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_Interface_quit_clicked():
	get_tree().quit()
