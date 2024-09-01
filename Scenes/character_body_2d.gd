extends CharacterBody2D

const JUMP : int = -120
const GRAVITY : int = 250
const WALK : int = 160

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	var key_salto = Input.is_action_just_pressed("Jump")
	if key_salto and is_on_floor():
		velocity.y = JUMP
	
	move_and_slide()

func _process(_delta):
	var key_walk = Input.get_axis("izquierda","derecha")
	velocity.x = key_walk * WALK
	
	move_and_slide()
