extends Node2D

var isActive:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func activate() -> void:
	isActive = true
	visible = true


func _on_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn")
	match get_tree().current_scene.name:
		"test":
			get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn")
		"Level2":
			get_tree().change_scene_to_file("res://Scenes/Levels/level3.tscn")
		"level3":
			get_tree().change_scene_to_file("res://Scenes/Levels/youwin.tscn")
