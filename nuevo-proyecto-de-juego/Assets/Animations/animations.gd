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
		
	if Input.is_action_pressed("ui_left_arrow"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("soldierwalk")
		velocity.x = move_toward(velocity.x, 0, 20)
		pass
	if Input.is_action_pressed("ui_right_arrow"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("soldierwalk")
		velocity.x = move_toward(velocity.x, 0, 20)
	else:
		$AnimatedSprite2D.play("soldieridle")
		pass
	move_and_slide()

var animation_player: AnimatedSprite2D

func _ready():
	animation_player = $AnimatedSprite2D
func _process(_delta):
	if Input.is_action_pressed("ui_right_arrow"):
		play_soldierattack1()

func play_soldierattack1():
	animation_player.stop()
	animation_player.play("soldierattack1") 

func _on_animated_sprite_2d_animation_finished() -> void:
	pass # Replace with function body.
