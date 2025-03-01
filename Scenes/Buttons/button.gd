extends Node2D
var pressedBy:int = 0
@onready var label = $Label
func isPressed() -> bool:
	return pressedBy > 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#match label.text:
		#"yellowButton":
			#self.collision_layer = 4
			#self.collision_mask = 4
		#"blueButton":
			#self.collision_layer = 3
			#self.collision_mask = 3
		#"redButton":
			#self.collision_layer = 2
			#self.collision_mask = 2
		#"greenButton":
			#self.collision_layer = 5
			#self.collision_mask = 5
			

func _on_area_entered(area: Area2D) -> void:
	pressedBy += 1
	print("Area Entered"+label.text)
	match label.text:
		"yellowButton":
			get_tree().call_group("Yellow Wall", "disappear")
		"blueButton":
			get_tree().call_group("Blue Wall", "disappear")
		"redButton":
			get_tree().call_group("Red Wall", "disappear")
		"greenButton":
			get_tree().call_group("Green Wall", "disappear")
func _on_area_exited(area: Area2D) -> void:
	pressedBy -= 1
	if pressedBy == 0:
		match label.text:
			"yellowButton":
				get_tree().call_group("Yellow Wall", "reappear")
			"blueButton":
				get_tree().call_group("Blue Wall", "reappear")
			"redButton":
				get_tree().call_group("Red Wall", "reappear")
			"greenButton":
				get_tree().call_group("Green Wall", "reappear")
