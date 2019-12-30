extends StaticBody2D

var isCollected = false
func onCollect():
	#there were some issues where items are collected twice
	# hope this fixes it
	if !isCollected:
		Inventory.addCoins(1)
		queue_free()
		isCollected = true
