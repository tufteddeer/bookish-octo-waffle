extends StaticBody2D

onready var state_machine = $"../AnimationTree".get("parameters/playback")
func _input(event):
	if event.is_action_pressed("skill_1"):
		state_machine.travel("attack_melee")