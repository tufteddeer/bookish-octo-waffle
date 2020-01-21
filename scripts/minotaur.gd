extends "res://scripts/Mob.gd"

func _hit():
	print("minotaur got hit!")
	print("hp:" + String(health))

func _die():
	print("minotaur died :(")
