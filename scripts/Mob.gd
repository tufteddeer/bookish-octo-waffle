extends KinematicBody2D

#the mobs type(imp, minotaur,...). used in quests.
export(String) var mob_type = "MobSuper"

onready var healthbar = $"Healthbar"
export(int) var max_health = 10
var health

func _ready():
	print("foo")
	health = max_health
	healthbar.max_value = max_health
	healthbar.value = max_health

func hit(damage):
	health -= damage
	
	healthbar.value = health

	_hit()
	if health <= 0:
		die()

func die():
	QuestManager.updateQuest(mob_type, "kill", 1)
	_die()
	queue_free()

# This functions can be overwritten by inheriting objects
func _hit():
	pass

func _die():
	pass