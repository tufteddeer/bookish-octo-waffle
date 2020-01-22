extends StaticBody2D

const Coin = preload("res://objects/Coin.tscn")

onready var hint_label = $"/root/Node2D/UI/UILayer/hint"
onready var loot_spawn = $"loot_spawn"
var player_present = false
var opened = false

export(int) var drop_coin_amount = 10

func _input(event):
	if player_present and event.is_action_pressed("interact") and not opened:
		$AnimationPlayer.play("open")
		opened = true
		$range/CollisionShape2D.disabled = true
		
func _on_range_body_entered(body):
	if body.name == "Player" and not opened:
		player_present = true
		hint_label.visible = true
		hint_label.text = "Press E to open"

func _on_range_body_exited(body):
	if body.name == "Player":
		player_present = false
		hint_label.visible = false

func _on_AnimationPlayer_animation_finished(anim_name):
	print(anim_name)
	var node = Coin.instance()
	node.amount = drop_coin_amount
	node.set_global_position(loot_spawn.get_global_position())
	get_tree().get_current_scene().add_child(node)
