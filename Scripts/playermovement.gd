extends CharacterBody2D
const SPEED = 300
@onready var label = $Label
func _physics_process(delta: float)-> void:
	var screen_position = global_position
	var inputdirection_y := Input.get_axis("Up", "Down")
	var inputdirection_x := Input.get_axis("Left", "Right")
	if inputdirection_y > 0:
		velocity.y = SPEED
	if inputdirection_y < 0:
		velocity.y = SPEED * -1
	if inputdirection_y == 0:
		velocity.y = 0
	if inputdirection_x < 0:
		velocity.x = SPEED * -1
	if inputdirection_x > 0:
		velocity.x = SPEED
	if inputdirection_x == 0:
		velocity.x = 0
	label.text = screen_position
	move_and_slide()
