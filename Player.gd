extends KinematicBody

var mouse_invert_x = false
var mouse_invert_y = false
var mouse_sensitivity = 0.3

var velocity = 0

const WALK_SPEED = 7
const RUN_SPEED = 14
const JUMP = 10

const GRAVITY = 9.8 * 3
const UP = Vector3(0, 1, 0)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func flatten(aim):
	aim.y = 0
	return aim.normalized()
	

func _physics_process(delta):
	var move = Vector3()
	var aim = $Head/Camera.global_transform.basis
	
	if Input.is_action_pressed("move_forward"):
		move += flatten(-aim.z)
	if Input.is_action_pressed("move_back"):
		move += flatten(aim.z)
	if Input.is_action_pressed("move_left"):
		move += flatten(-aim.x)
	if Input.is_action_pressed("move_right"):
		move += flatten(aim.x)
	
	velocity -= GRAVITY * delta
	
	if is_on_floor() and Input.is_action_just_pressed("move_jump"):
		velocity = JUMP
	
	var speed = WALK_SPEED
	if Input.is_action_pressed("move_sprint"):
		speed = RUN_SPEED
	
	velocity = move_and_slide(move.normalized() * speed + Vector3(0, velocity, 0), UP).y
	
	

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
		c = clamp(c + inverted_y * event.relative.y * mouse_sensitivity, -80, 80)
		$Head/Camera.rotation_degrees.x = c
