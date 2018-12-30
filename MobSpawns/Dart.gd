extends RigidBody2D

# TODO share with DartSpawner
enum DartType {Right, Left}
const legacyAdjust = 20
const kEnemyDropSpeed = legacyAdjust*Vector2(0,8)

var type setget set_type

func set_type(t):
	if t == Right || t == Left:
		type = t
	show_on_type()

func _ready():
	show_on_type()

func hide_yo_kids():
	$LDart.hide()
	$LDartDead.hide()
	$RDart.hide()
	$RDartDead.hide()

func show_on_type():
	match type:
		Right:
			$RDart.show()
		Left:
			$LDart.show()

func self_destruct():
	hide_yo_kids()
	linear_velocity = kEnemyDropSpeed
	match type:
		Right:
			$RDartDead.show()
		Left:
			$LDartDead.show()

func _physics_process(delta):
	# TODO replace with rubber band collision
	if Input.is_action_just_pressed("ui_accept"):
		self_destruct()