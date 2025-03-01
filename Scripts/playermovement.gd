extends CharacterBody2D
const PLAYER_SPEED = 300
func _physics_process(delta: float)-> void:
	var inputdirection_y := Input.get_axis("Up", "Down")
	var inputdirection_x := Input.get_axis("Left", "Right")
	if inputdirection_y > 0:
		velocity.y = PLAYER_SPEED
	if inputdirection_y < 0:
		velocity.y = PLAYER_SPEED * -1
	if inputdirection_y == 0:
		velocity.y = 0
	if inputdirection_x < 0:
		velocity.x = PLAYER_SPEED * -1
	if inputdirection_x > 0:
		velocity.x = PLAYER_SPEED
	if inputdirection_x == 0:
		velocity.x = 0
	move_and_slide()
