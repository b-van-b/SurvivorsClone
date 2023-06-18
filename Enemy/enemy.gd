extends CharacterBody2D

@export var movement_speed : float = 20.0

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	sprite.play("walk")

func _physics_process(_delta):
	var direction : Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()
