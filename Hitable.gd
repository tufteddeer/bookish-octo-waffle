extends KinematicBody2D

export(int) var maxHealth = 10
var health

func _ready():
	health = maxHealth
func _process(delta):
	update()

func _draw():
	# draw health bar
	draw_rect(Rect2(Vector2(-5,2), Vector2(10 * health/maxHealth,1)), Color(255,0,0), true)
	draw_rect(Rect2(Vector2(-5,2), Vector2(10,1)), Color(136, 2, 122), false)

func hit(damage):
	health -= damage
	if health <= 0:
		queue_free()
