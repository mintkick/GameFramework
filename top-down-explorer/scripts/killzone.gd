extends Area2D

@onready var timer: Timer = $Timer
@onready var sfx: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
var time_delta = 0

# runs every frame
func _process(delta: float) -> void:
	if time_delta: # if not 0
		time_slow_down(time_delta)

# body refers to the body *that entered the area*
func _on_body_entered(body: Node2D) -> void:
	
	print("Ouch.")
	if body.get_node("CollisionShape2D") != null: # possibly not needed anymore since layer bugfix
		body.get_node("CollisionShape2D").queue_free()
	sfx.play()
	timer.start()
	time_delta = 0.93

func time_slow_down(time_delta) -> void:
	Engine.time_scale *= time_delta
	
	if Engine.time_scale <= 0.1:
		Engine.time_scale = 1
		get_tree().reload_current_scene()
