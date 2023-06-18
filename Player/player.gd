extends CharacterBody2D

var movement_speed : float = 40.0
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta):
	movement()

func movement() -> void:
	var x_mov : float = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov : float = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov : Vector2 = Vector2(x_mov, y_mov)
	if mov.x > 0:
		sprite.flip_h = true
	elif mov.x < 0:
		sprite.flip_h = false
	
	if mov.length() > 0:
		sprite.animation = "walk"
		sprite.play()
	else:
		sprite.animation = "stand"
		sprite.stop()
	
	velocity = mov.normalized()*movement_speed
	move_and_slide()

