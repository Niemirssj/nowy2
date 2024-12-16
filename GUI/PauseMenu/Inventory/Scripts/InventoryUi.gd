class_name InventoryUI extends Control

const 	INVENTORY_SLOT = preload("res://GUI/PauseMenu/Inventory/InventorySlot.tscn")

@export var data : InventoryData

@onready var pause_menu: CanvasLayer = $"../../.."

func _ready() -> void:
	PauseMenu.shown.connect(UpdateInventory)
	PauseMenu.hidden.connect(ClearInventory)
	
	ClearInventory()
	pass

func ClearInventory() -> void:
	for c in get_children():
		c.queue_free()
	


func UpdateInventory() -> void:
	for s in data.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data=s
	get_child(0).grab_focus()
	pass
