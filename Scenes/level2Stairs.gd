extends Node2D
var isActive:bool = true

func activate() -> void:
	isActive = true
	visible = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func _on_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level3.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reappear():
	pass

func disappear():
	activate()
