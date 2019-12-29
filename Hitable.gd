extends KinematicBody2D

export(int) var maxHealth = 10
var health

var healthbar
func _ready():
	health = maxHealth
	healthbar = get_node("Healthbar")
func _process(delta):
	update()

func hit(damage):
	health -= damage
	
	healthbar.value = (health * 100) / (10)
	print(healthbar.value)
	if health <= 0:
		queue_free()
