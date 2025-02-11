extends CharacterBody2D

signal health_depleted

var speed = 600
var player_health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right",
	"move_up", "move_down")
	
	velocity = direction * speed
	move_and_slide()

	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		player_health -= DAMAGE_RATE* overlapping_mobs.size() * delta
		%ProgressBar.value = player_health
		if player_health <= 0.0:
			health_depleted.emit()
