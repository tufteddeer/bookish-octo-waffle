# The QuestRelevant script gets attached to Nodes that are relevant
# for tasks the player can complete.

# TODO: this could be integrated in the Hitable scipt
extends Node
var task = "kill"
var what = "imp"

func onDie():
	QuestManager.updateQuest(what, task, 1)