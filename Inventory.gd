extends Node

var coins = 0

var coinAmountLabel = null

func _ready():
	coinAmountLabel = get_node("/root/Node2D/UI/CanvasLayer/CoinValue")

func addCoins(amount):
	coins += amount
	print(coins)


func _process(delta):
	coinAmountLabel.text = String(coins)