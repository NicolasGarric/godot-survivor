extends CharacterBody2D

var speed = 600

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right",
	"move_up", "move_down")
	
	velocity = direction * speed
	move_and_slide()

	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()
