extends RigidBody2D

var desiredVel = Vector2(0,0)
var heldLeft
var heldRight

enum Facing {Left,Right}
var facing

const normalThrust = 20*5
const impulse = 20*2

func _ready():
	pass

func _process(delta):
	heldRight = Input.is_action_pressed("ui_right")
	heldLeft = Input.is_action_pressed("ui_left")

func _physics_process(delta):
	if heldRight && heldLeft:
		if facing == Left:
			# TODO switch facing to the Right
			pass
		elif facing == Right:
			# TODO switch facing to the Left
			pass
	elif heldLeft:
		desiredVel = Vector2(-normalThrust,0)
		# TODO tipped
		pass
	elif heldRight:
		desiredVel = Vector2(normalThrust,0)
		# TODO tipped
		pass
	var a = impulse
	if desiredVel.x < 0:
		a = -a
	linear_velocity.x += a
	if abs(linear_velocity.x) >= abs(desiredVel.x):
		linear_velocity.x = desiredVel.x
	desiredVel.x = 0