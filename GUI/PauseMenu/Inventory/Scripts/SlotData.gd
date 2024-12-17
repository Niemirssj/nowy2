class_name SlotData extends Resource

@export var item : ItemData
@export var quantity: int = 0 : set = SetQuantity


func SetQuantity(value : int) -> void:
	quantity = value
	if quantity < 1:
		emit_changed()
	pass
