extends "res://scripts/Mob.gd"

func _hit():
	print(mob_type + " got hit!")
	print("hp:" + String(health))

func _die():
	print("minotaur died :(")
