# The QuestManager gets notified when something happens that could
# eventually be relevant for a quest (e.g. the death of an enemy)
# and checks wether there is a corresponding quest. If a quest is finished, the Quest
extends Node

var QuestClass = preload("res://scripts/Quest.gd")
var quests = [QuestClass.Quest.new("kill", 3, "minotaur"),
QuestClass.Quest.new("kill", 3, "imp")]

onready var UIContainer = $"/root/Node2D/UI/UILayer/QuestInfoContainer"
var UIQuestInfo = preload("res://UI/QuestInfo.tscn")

func _ready():
	displayQuests()
		
func updateQuest(what, task, howMuch):
	for quest in quests:
		if quest.what == what && quest.task == task && quest.active:
			quest.howMuchDone += howMuch
			if quest.howMuch == quest.howMuchDone:
				quest.finished()
	
	#remove exisiting quest describtion UI elements and redraw
	for children in UIContainer.get_children():
		children.queue_free()
	displayQuests()

func displayQuests():
	for quest in quests:
		addQuestInfoUI(quest)

func addQuestInfoUI(quest):
	var node = UIQuestInfo.instance()

	node.get_node("task").text = quest.task
	node.get_node("what").text = quest.what
	node.get_node("progressText").text = String(quest.howMuchDone) + "/" + String(quest.howMuch)
	UIContainer.add_child(node)