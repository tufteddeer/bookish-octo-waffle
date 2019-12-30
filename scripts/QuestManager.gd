# The QuestManager gets notified when something happens that could
# eventually be relevant for a quest (e.g. the death of an enemy)
# and checks wether there is a corresponding quest. If a quest is finished, the Quest
extends Node

var QuestClass = preload("res://scripts/Quest.gd")
var quests = [QuestClass.Quest.new("kill", 3, "imp")]

func _ready():
	for quest in quests:
		print(quest.task)
		print(quest.what)
		print(quest.howMuchDone)
		
func updateQuest(what, task, howMuch):
	for quest in quests:
		if quest.what == what && quest.task == task && quest.active:
			quest.howMuchDone += howMuch
			if quest.howMuch == quest.howMuchDone:
				quest.finished()