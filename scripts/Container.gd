extends "res://scripts/Interactable.gd"

const Coin = preload("res://objects/Coin.tscn")

onready var loot_spawn = $"loot_spawn"
var opened = false

export(int) var drop_coin_amount = 10

func _interact():
	if not opened:
		$AnimationPlayer.play("open")
		opened = true
		$nearby/CollisionShape2D.disabled = true

func _on_AnimationPlayer_animation_finished(anim_name):
	var node = Coin.instance()
	node.amount = drop_coin_amount
	node.set_global_position(loot_spawn.get_global_position())
	get_tree().get_current_scene().add_child(node)
