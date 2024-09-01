extends CharacterBody2D

const JUMP : int = -120
const GRAVITY : int = 250
const WALK : int = 160

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	var key_salto = Input.is_action_just_pressed("Jump")
	if key_salto and is_on_floor():
		velocity.y = JUMP

	if not is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "Jump"
		else:
			$AnimatedSprite2D.animation = "JumpFall"
			$Fall.start(0.2)
			if $Fall.time_left == 0:
				print("hola")
				$AnimatedSprite2D.animation = "Fall"
	else:
		$AnimatedSprite2D.animation = "Idle"
	
	move_and_slide()

func _process(_delta):
	var key_walk = Input.get_axis("izquierda","derecha")
	velocity.x = key_walk * WALK
	if velocity.x == 160 or velocity.x == -160:
		$AnimatedSprite2D.animation = "Walk"
	else:
		$AnimatedSprite2D.animation = "Idle"
	
	move_and_slide()
