extends KinematicBody2D

var dest = Vector2()
var speed = 120
var velocity = Vector2()
var maxRange = 100

func _ready():

	dest = get_local_mouse_position().normalized() * maxRange
	look_at(dest)

# warning-ignore:unused_argument
func _physics_process(delta):
	velocity = (dest - position).normalized() * speed
	rotation = velocity.angle()
	if (dest - position).length() > 5:
		velocity = move_and_slide(velocity)
	else:
		free()
