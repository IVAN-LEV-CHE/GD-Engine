extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

#Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left","ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x,0,20)
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("soldierwalk")
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("soldierwalk")
	if direction == 0:
		$AnimatedSprite2D.play("soldieridle")
	move_and_slide()

@onready var anim_player = $AnimationPlayer
var looping_animations = ["soldieridle", "soldierwalk"]  # Lista de animaciones que hacen loop
var is_override_active = false

# Función para detener las animaciones en loop
func stop_looping_animations():
	for anim in looping_animations:
		if anim_player.is_playing() and anim_player.current_animation == anim:
			anim_player.stop()
			is_override_active = true

# Función para reproducir una animación puntual y luego restaurar las animaciones en loop
func play_override_animation(soldieratack1: String):
	stop_looping_animations()
	anim_player.play("soldierattack1")

	await anim_player.animation_finished  # Espera a que la animación termine
	is_override_active = false
	resume_looping_animations()

# Función para reanudar las animaciones en loop
func resume_looping_animations():
	if not is_override_active:
		anim_player.play("soldieridle")  # O la animación de "por defecto"

# Ejemplo de llamada, como podría ser al presionar una tecla
func _input(ui_right_arrow):
	if Input.is_action_pressed("ui_right_arrow"):
		play_override_animation("soldierattack1")
