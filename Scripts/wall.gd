extends Node2D
@onready var collision = $StaticBody2D
@onready var sprite = $Sprite2D
var catcount = 0
func disappear():
	collision.process_mode = Node.PROCESS_MODE_DISABLED
	sprite.modulate.a = .5
func reappear():
	collision.process_mode = Node.PROCESS_MODE_ALWAYS
	sprite.modulate.a = 1
