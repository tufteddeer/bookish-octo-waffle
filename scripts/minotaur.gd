extends "res://scripts/Mob.gd"

func _hit():
	print(mob_type + " got hit!")
	print("hp:" + String(health))

func _die():
	print("minotaur died :(")

#enable the epic boss healtbar when the player is near
func _on_nearby_body_entered(body):
	if body.name == "Player" and health > 0:
		enable_boss_healthbar()
		
func _on_nearby_body_exited(body):
	if body.name == "Player":
		disable_boss_healthbar()
