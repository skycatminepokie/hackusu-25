extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($Button.isPressed() && $Button2.isPressed() && $Button3.isPressed() && $Button4.isPressed()):
		$Stairs.activate()
	pass
