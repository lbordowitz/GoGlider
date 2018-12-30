extends Node2D

const Dart = preload("res://MobSpawns/Dart.tscn")
#TODO share with Dart
enum DartType {Right, Left}
const legacyAdjust = 20
const kDartVelocity = legacyAdjust*Vector2(6,2)

export(DartType) var type
export(float) var despawn_v

var dart
var timer

func _ready():
	dart = Dart.instance()

func init_dart():
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
	remove_child(dart)
	dart.queue_free()
	dart = Dart.instance()
	$SpawnTimer.start()
