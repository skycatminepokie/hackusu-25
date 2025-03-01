extends CharacterBody2D

@onready var label = $Label
func pushback(number,smallnumber,bignumber):
	var newnumber = 0
	if number > bignumber:
		newnumber = ((number - bignumber) * -1) / 14
	if number < smallnumber:
		newnumber = (smallnumber - number) / 14
	return newnumber
func _physics_process(delta: float)-> void:
	var speed = 500
	var inputdirection = Vector2(0,0)
	var screen_position = get_global_transform_with_canvas().origin
	inputdirection.y = Input.get_axis("Up", "Down")
	inputdirection.x = Input.get_axis("Left", "Right")
	match inputdirection:
		Vector2(-1,1):
			velocity = Vector2(0,speed)
		Vector2(0,0):
			velocity = Vector2.ZERO
		Vector2(1,1):
			velocity = Vector2(0,speed)
		Vector2(-1,-1):
			velocity = Vector2(0,speed*-1)
		Vector2(1,-1):
			velocity = Vector2(0,speed*-1)
		Vector2(1,0):
			velocity = Vector2(speed, 0)
		Vector2(-1,0):
			velocity = Vector2(speed*-1, 0)
		Vector2(0,-1):
			velocity = Vector2(0, speed*-1)
		Vector2(0,1):
			velocity = Vector2(0, speed)
		Vector2(1,1):
			velocity = Vector2.ZERO
	if screen_position.y > 840 or screen_position.y < 240:
		position.y += pushback(screen_position.y, 240,840)
	if screen_position.x > 1680 or screen_position.x < 240:
		position.x += pushback(screen_position.x, 240, 1680)
		
		
	label.text = str(inputdirection)
	
	move_and_slide()
