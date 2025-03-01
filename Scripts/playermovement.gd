extends CharacterBody2D
const SPEED = 500
@onready var label = $Label
func _physics_process(delta: float)-> void:
	var inputdirection = Vector2(0,0)
	var screen_position = global_position
	inputdirection.y = Input.get_axis("Up", "Down")
	inputdirection.x = Input.get_axis("Left", "Right")
	match inputdirection:
		Vector2(0,0):
			velocity = Vector2.ZERO
		Vector2(1,0):
			velocity = Vector2(SPEED,0)
		Vector2(-1,0):
			velocity = Vector2(SPEED * -1,0)
		Vector2(0,-1):
			velocity = Vector2(0,SPEED*-1)
		Vector2(0,1):
			velocity = Vector2(0,SPEED)
		
	label.text = str(inputdirection)
	if screen_position.y > 300 or screen_position.y < -300:
		label.text = "I'm pushing the camera"
	if screen_position.x > 600 or screen_position.x < -600:
		label.text = "I'm pushing the camera"
	move_and_slide()
