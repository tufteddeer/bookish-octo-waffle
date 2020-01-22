extends Node

# enumeration of every item id in the game
enum ITEM_TYPE { COIN}

# the items our player has
var items : Dictionary

onready var coinAmountLabel = $"/root/Node2D/UI/UILayer/CoinValue"

func add_items(id, amount):
	if not items.has(id):
		items[id] = amount
	else:
		items[id] += amount
		
	print("inventory:")
	print(items)
	
	if id == ITEM_TYPE.COIN:
		update_coin_label()

func update_coin_label():
	var coin_amount := 0
	if items.has(ITEM_TYPE.COIN):
		coin_amount = items[ITEM_TYPE.COIN]
	coinAmountLabel.text = String(coin_amount)