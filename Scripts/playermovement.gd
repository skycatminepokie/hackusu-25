extends CharacterBody2D
@onready var area = $Area2D
@onready var camera = $"../Camera2D"
@onready var animation = $"AnimatedSprite2D"
signal pushcamera(direction)
func pushback(number,smallnumber,bignumber):
	var newnumber = 0
	if number > bignumber:
		newnumber = ((number - bignumber) * -1) / 14
	if number < smallnumber:
		newnumber = (smallnumber - number) / 14
	return newnumber
func _ready():
	motion_mode = MOTION_MODE_FLOATING
	if name == "Player":
		area.collision_layer = 2
		area.collision_mask = 2
		animation.animation = "player1"
	if name == "Player2":
		area.collision_layer = 3
		area.collision_mask = 3
		animation.animation = "player2"
	if name == "Player3":
		area.collision_layer = 4
		area.collision_mask = 4
		animation.animation = "player3"
	if name == "Player4":
		area.collision_layer = 5
		area.collision_mask = 5
		animation.animation = "player4"
func _physics_process(delta: float)-> void:
	var speed = 1000
	var inputdirection = Vector2(0,0)
	var screen_position = get_global_transform_with_canvas().origin
	if name == "Player2":
		inputdirection.y = Input.get_axis("Up2", "Down2")
		inputdirection.x = Input.get_axis("Left2", "Right2")
	if name == "Player":
		inputdirection.y = Input.get_axis("Up", "Down")
		inputdirection.x = Input.get_axis("Left", "Right")
	match inputdirection:
		Vector2(-1,1):
			velocity = Vector2(0,speed)
			animation.frame = 0
		Vector2(0,0):
			velocity = Vector2.ZERO
		Vector2(1,1):
			velocity = Vector2(0,speed)
			animation.frame = 0
		Vector2(-1,-1):
			velocity = Vector2(0,speed*-1)
			animation.frame = 3
		Vector2(1,-1):
			velocity = Vector2(0,speed*-1)
			animation.frame = 3
		Vector2(1,0):
			velocity = Vector2(speed, 0)
			animation.frame = 2
		Vector2(-1,0):
			velocity = Vector2(speed*-1, 0)
			animation.frame = 1
		Vector2(0,-1):
			velocity = Vector2(0, speed*-1)
			animation.frame = 3
		Vector2(0,1):
			velocity = Vector2(0, speed)
			animation.frame = 0
		Vector2(1,1):
			velocity = Vector2.ZERO
	var ypush = pushback(screen_position.y, 240,840)
	var xpush = pushback(screen_position.x, 240, 1680)
	position.y += ypush
	position.x += xpush
	camera.position.x -= xpush
	camera.position.y -= ypush
	move_and_slide()
