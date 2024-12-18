extends CharacterBody2D

const SPEED = 100

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
#@onready var collision_shape: CollisionShape2D = $CollisionShape2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	# move horizontally
	var direction_h := Input.get_axis("ui_left", "ui_right")
	if direction_h:
		velocity.x = SPEED * direction_h
		if direction_h < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
		#print(velocity.x) # DEBUG
		#if abs(velocity.x) <= 80: # build up but limit speed. add += below
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# move vertically
	var direction_v := Input.get_axis("ui_up", "ui_down")
	if direction_v:
		velocity.y = SPEED * direction_v
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# play animation when walking or idle
	if direction_h or direction_v:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	# perform movement operations on position
	move_and_slide()
