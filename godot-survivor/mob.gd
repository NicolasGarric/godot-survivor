extends CharacterBody2D

var player
var basic_mob_speed = 300.0
var basic_mob_health = 3

func _ready() -> void:
	player = get_node("/root/Game/player")
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * basic_mob_speed
	move_and_slide()

func take_damage():
	
	basic_mob_health -= 1
	%Slime.play_hurt()

	if basic_mob_health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
