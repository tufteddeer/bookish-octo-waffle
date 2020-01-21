extends StaticBody2D

var isCollected = false
export(int) var coin_amount = 1
func onCollect():
	#there were some issues where items are collected twice
	# hope this fixes it
	if !isCollected:
		Inventory.addCoins(coin_amount)
		queue_free()
		isCollected = true
