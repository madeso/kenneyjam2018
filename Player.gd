extends KinematicBody

var mouse_invert_x = false
var mouse_invert_y = false
var mouse_sensitivity = 0.3

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event is InputEventMouseMotion:
		var inverted_x = -1
		if mouse_invert_x:
			inverted_x = 1
		var inverted_y = -1
		if mouse_invert_y:
			inverted_y = 1
		$Head.rotate_y( inverted_x * deg2rad(event.relative.x * mouse_sensitivity) )
		var c = $Head/Camera.rotation_degrees.x
		c += inverted_y * event.relative.y * mouse_sensitivity
		if c < -80:
			c = -80
		if c > 80:
			c = 80
		$Head/Camera.rotation_degrees.x = c
