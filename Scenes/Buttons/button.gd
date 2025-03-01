extends Node2D
var pressedBy:int = 0

func isPressed() -> bool:
	return pressedBy > 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_entered(area: Area2D) -> void:
	pressedBy += 1
	get_tree().call_group("Yellow Wall", "disappear")


func _on_area_exited(area: Area2D) -> void:
	pressedBy -= 1
	if pressedBy == 0:
		get_tree().call_group("Yellow Wall", "reappear")
