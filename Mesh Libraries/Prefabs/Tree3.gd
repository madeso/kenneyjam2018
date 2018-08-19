extends MeshInstance

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	rotate_y(rand_range(0, 2*PI))
	var s = rand_range(0.9, 1.3)
	scale = Vector3(s, s, s)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
