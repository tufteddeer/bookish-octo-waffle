# The quest-Class is used to store metadata about specific objectives
# Quests are stored in the QuestManager

class Quest:
    var task # e.g. kill, fetch
    var what # e.g. Imp, Dragon, Sword
    var howMuch # some number here

    var howMuchDone = 0

    var active = true
    
    func _init(task, howMuch, what):
        self.task = task
        self.howMuch = howMuch
        self.what = what

    func finished():
        active = false
        print("Quest finished")