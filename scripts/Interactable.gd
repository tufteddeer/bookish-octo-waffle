extends Node2D

# Interactable relies on a "nearby" Area2D
# that defines witch area the player has to be within to interact
# with the object
onready var nearby : Area2D = $nearby
# we use an ui label to display tooltips
onready var hint_label : Label = $"/root/Node2D/UI/UILayer/hint"
export(String) var hint

var player_present = false

func _input(event):
	if player_present and event.is_action_pressed("interact"):
		_interact()

func _ready():
	nearby.connect("body_entered", self, "_on_Body_entered")
	nearby.connect("body_exited", self, "_on_Body_exited")

func _on_Body_entered(body):
	if body.name == "Player":
		player_present = true
		if hint_label != null and hint != null:
			hint_label.visible = true
			hint_label.text = hint

func _on_Body_exited(body):
	if body.name == "Player":
		player_present = false
		hint_label.visible = false

# to be overwritten
func _interact():
	pass