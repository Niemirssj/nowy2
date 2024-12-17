class_name InventoryUI extends Control

const 	INVENTORY_SLOT = preload("res://GUI/PauseMenu/Inventory/InventorySlot.tscn")

var focusindex : int =0

@export var data : InventoryData

@onready var pause_menu: CanvasLayer = $"../../.."

func _ready() -> void:
	PauseMenu.shown.connect(UpdateInventory)
	PauseMenu.hidden.connect(ClearInventory)
	
	ClearInventory()
	data.changed.connect(OnInventoryChanged)
	pass

func ClearInventory() -> void:
	for c in get_children():
		c.queue_free()
	


func UpdateInventory() -> void:
	for s in data.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data=s
		new_slot.focus_entered.connect(ItemFocused)
	get_child(0).grab_focus()
	pass

func OnInventoryChanged() -> void:
	ClearInventory()
	UpdateInventory()
	await get_tree().process_frame
	get_child(focusindex).grab_focus()
	pass

func ItemFocused() -> void:
	for i in get_child_count():
		if get_child(i).has_focus():
			focusindex = i
			return
	pass
