extends CharacterBody2D

var player
var basic_mob_speed = 300.0
var basic_mob_health = 3

func _ready() -> void:
	player = get_node("/root/Game/player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * basic_mob_speed
	move_and_slide()

func take_damage():
	basic_mob_health -= 1

	if health == 0:
		queue_free()
