extends Node2D

const Dart = preload("res://MobSpawns/Dart.tscn")
const Sparkle = preload("res://Collectables/Sparkle.tscn")
#TODO share with Dart
enum DartType {Right, Left}
const legacyAdjust = 20
const kDartVelocity = legacyAdjust*Vector2(6,2)

export(DartType) var type
export(float) var despawn_v

var dart
var sparkle
var timer

func _ready():
	dart = Dart.instance()

func sparkle(function_name, position=Vector2(0,0)):
	sparkle = Sparkle.instance()
	sparkle.position = position
	sparkle.connect("animation_finished",self,function_name)
	sparkle.play()
	add_child(sparkle)

func sparkle_spawn():
	sparkle("init_dart")

func init_dart():
	sparkle_despawn()
	var vel = kDartVelocity
	if (type == Left):
		vel.x = -vel.x
	dart.linear_velocity = vel
	dart.type = type
	add_child(dart)

func _process(delta):
	if (dart.position.y >= despawn_v):
		dart_despawn()

func dart_despawn():
	var end_position = dart.position
	remove_child(dart)
	dart.queue_free()
	dart = Dart.instance()
	$SpawnTimer.start()
	sparkle("sparkle_despawn", end_position)

func sparkle_despawn():
	remove_child(sparkle)
	sparkle.queue_free()