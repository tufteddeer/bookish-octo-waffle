# The QuestManager gets notified when something happens that could
# eventually be relevant for a quest (e.g. the death of an enemy)
# and checks wether there is a corresponding quest. If a quest is finished, the Quest
extends Node

const TASK_KILL = "kill"

var QuestClass = preload("res://scripts/Quest.gd")
var quests = [
	QuestClass.Quest.new(TASK_KILL, 3, "minotaur"),
	QuestClass.Quest.new(TASK_KILL, 3, "imp")
]

onready var ui_tree = $"/root/Node2D/UI/UILayer/QuestTree"

var UIQuestInfo = preload("res://UI/QuestInfo.tscn")

func _ready():
	displayQuests()
		
func updateQuest(what, task, howMuch):
	for quest in quests:
		if quest.what == what && quest.task == task && quest.active:
			quest.howMuchDone += howMuch
			if quest.howMuch == quest.howMuchDone:
				quest.finished()
	
	displayQuests()

func displayQuests():
	
	ui_tree.clear()
	
	var root = ui_tree.create_item()
	root.set_text(0, "Quests")
	for quest in quests:
		var quest_child = ui_tree.create_item(root)
		quest_child.set_text(0, quest.task + " " + quest.what + " " + String(quest.howMuchDone) + "/" + String(quest.howMuch))
