class_name DamageData

var author_node: Node
var amount: int

func _init(author: Node, amount: int):
	self.author_node = author
	self.amount = amount