extends MeshInstance

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	rotate_z(delta * deg2rad(15))
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
