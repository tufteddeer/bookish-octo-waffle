extends Node2D

const Coin = preload("res://Coin.tscn")

func onDie():
	var node = Coin.instance()
	node.set_global_position(get_global_position())
	get_tree().get_current_scene().add_child(node)