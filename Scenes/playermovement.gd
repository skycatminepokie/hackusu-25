extends CharacterBody2D

func _physics_process(delta: float)-> void:
	if Input.is_action_just_pressed("Up"):
		velocity.y -= 100
	move_and_slide()
