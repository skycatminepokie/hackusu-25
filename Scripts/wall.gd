extends Node2D
@onready var collision = $StaticBody2D
func disappear():
	collision.process_mode = Node.PROCESS_MODE_DISABLED
func reappear():
	collision.process_mode = Node.PROCESS_MODE_ALWAYS
