extends Node2D

const fireball = preload("res://fireball.tscn")
func _input(event):
	if event.is_action_pressed("down"):
		var node = fireball.instance()
		node.set_global_position(get_global_position())
		print(node.get_position())
		get_tree().get_current_scene().add_child(node)
