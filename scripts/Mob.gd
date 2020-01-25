extends KinematicBody2D

const Coin = preload("res://objects/Coin.tscn")

#the mobs type(imp, minotaur,...). used in quests.
export(String) var mob_type = "MobSuper"
export(int) var drop_coin_amount = 1

onready var healthbar = $"Healthbar"
export(int) var max_health = 10
var health

#are we currently using the big health display?
var boss_healthbar_active = false
onready var boss_display = $"/root/Node2D/UI/UILayer/boss_display"
onready var boss_healthbar = boss_display.get_node("healthbar")
onready var boss_name_label = boss_display.get_node("name")
onready var boss_health_label = boss_display.get_node("boss_health")

onready var anim_player = $AnimationPlayer
func _ready():
	health = max_health
	healthbar.max_value = max_health
	healthbar.value = max_health

func hit(damage):
	health -= damage
	
	healthbar.value = health

	if boss_healthbar_active && health > 0:
		update_boss_healthbar()
	
	anim_player.play("hit")
	_hit()
	if health <= 0:
		die()

func die():
	QuestManager.updateQuest(mob_type, QuestManager.TASK_KILL, 1)
	if drop_coin_amount > 0:
		var node = Coin.instance()
		node.amount = drop_coin_amount
		node.set_global_position(get_global_position())
		get_tree().get_current_scene().add_child(node)

	anim_player.play("die")
	$CollisionShape2D.disabled = true
	healthbar.visible = false
	disable_boss_healthbar()
	_die()

func enable_boss_healthbar():
	boss_healthbar_active = true
	boss_display.visible = true
	update_boss_healthbar()

func update_boss_healthbar():
	boss_healthbar.value = health
	boss_healthbar.max_value = max_health
	boss_health_label.text = String(health) + "/" + String(max_health)
	boss_name_label.text = mob_type

func disable_boss_healthbar():
	boss_healthbar_active = false
	boss_display.visible = false

# This functions can be overwritten by inheriting objects
func _hit():
	pass

func _die():
	disable_boss_healthbar()
	pass