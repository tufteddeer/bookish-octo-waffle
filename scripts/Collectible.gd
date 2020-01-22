extends StaticBody2D

var isCollected = false
export(int) var amount = 1
export(Inventory.ITEM_TYPE) var item_id

func onCollect():
	#there were some issues where items are collected twice
	# hope this fixes it
	if !isCollected:
		Inventory.add_items(item_id, amount)
		queue_free()
		isCollected = true
