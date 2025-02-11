extends CharacterBody2D

var player
var basic_mob_speed = 300.0

func _ready() -> void:
	player = get_node("/root/Game/player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * basic_mob_speed
	move_and_slide()
