extends Node

var coins = 0

var coinAmountLabel = null

func _ready():
	coinAmountLabel = get_node("/root/Node2D/UI/UILayer/CoinValue")

func addCoins(amount):
	coins += amount

func _process(delta):
	coinAmountLabel.text = String(coins)