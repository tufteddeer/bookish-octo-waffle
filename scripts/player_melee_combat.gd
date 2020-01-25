extends Area2D

onready var state_machine = $"../AnimationTree".get("parameters/playback")

export(int) var damage = 3

func _input(event):
	if event.is_action_pressed("skill_1"):
		state_machine.travel("attack_melee")

func _on_melee_weapon_body_entered(body):
	if body.has_method("hit"):
		# use call_deferred to fix issues that occur because we are in an Area2D event
		# and I do not fully understand ¯\_(0.0)_/¯
		body.call_deferred("hit", damage)
