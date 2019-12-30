extends KinematicBody2D

export (int) var speed = 50

var target = Vector2()
var velocity = Vector2()

func _process(delta):
	if Input.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = (target - position).normalized() * speed
	# rotation = velocity.angle()
	if (target - position).length() > 5:
		velocity = move_and_slide(velocity)

	if get_slide_count() != 0 :
		for i in range (0,get_slide_count()) :
			var collision = get_slide_collision(i)
			var other = collision.collider
			if other != null:
				if other.has_method("onCollect"):
					other.onCollect()
			