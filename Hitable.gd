extends KinematicBody2D

export(int) var health = 10 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hit(damage):
	health -= damage
	if health <= 0:
		queue_free()
