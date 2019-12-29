extends KinematicBody2D

var damage = 5
var speed = 10
var maxRange = 50
var velocity = Vector2()
var origin = Vector2()
var destination = Vector2()

func _ready():
	destination = get_local_mouse_position().normalized() * maxRange
	rotation = global_position.angle_to(destination)
	velocity = destination.normalized() * speed


func _process(delta):

	if position.distance_to(origin) >= maxRange:
		queue_free()
	update()
	
func _physics_process(delta):
	var collision = move_and_collide(-(position - destination).normalized())
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(damage)
		queue_free()