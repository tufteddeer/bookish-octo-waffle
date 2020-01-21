extends KinematicBody2D

const Coin = preload("res://objects/Coin.tscn")

#the mobs type(imp, minotaur,...). used in quests.
export(String) var mob_type = "MobSuper"
export(int) var drop_coin_amount = 1

onready var healthbar = $"Healthbar"
export(int) var max_health = 10
var health

func _ready():
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
	QuestManager.updateQuest(mob_type, QuestManager.TASK_KILL, 1)
	if drop_coin_amount > 0:
		var node = Coin.instance()
		node.coin_amount = drop_coin_amount
		node.set_global_position(get_global_position())
		get_tree().get_current_scene().add_child(node)

	_die()
	queue_free()

# This functions can be overwritten by inheriting objects
func _hit():
	pass

func _die():
	pass