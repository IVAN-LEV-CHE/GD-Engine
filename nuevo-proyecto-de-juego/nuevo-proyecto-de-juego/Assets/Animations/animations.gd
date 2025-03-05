extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

#Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
	
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
	
	if direction == -1 || direction == 1:
		$AnimatedSprite2D.play("soldierwalk")
		pass
	if direction == 0:
		$AnimatedSprite2D.play("soldieridle")
		pass
	
	if Input.is_action_pressed("ui_right_arrow"):
		$Timer.start()
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("soldierattack1")
		direction= 2
		
		pass
	
	if direction == 2:
		velocity.x = 0
		pass

	print(direction)
	move_and_slide()
