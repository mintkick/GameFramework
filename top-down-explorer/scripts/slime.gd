extends Node2D

const SPEED = 60
var direction = 1 # start facing right

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_l: RayCast2D = $RayCastL
@onready var ray_cast_r: RayCast2D = $RayCastR


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# just moves up and down
	if ray_cast_l.is_colliding():
		direction = 1 # turn right
		animated_sprite.flip_h = false
	elif ray_cast_r.is_colliding():
		direction = -1 # turn left
		animated_sprite.flip_h = true
	
	position.x += SPEED * direction * delta
