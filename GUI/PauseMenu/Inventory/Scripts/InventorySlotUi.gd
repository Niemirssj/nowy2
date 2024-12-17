class_name InventorySlotUi extends Button

var slot_data : SlotData : set=SetSlotData
@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_rect.texture = null
	label.text=""
	focus_entered.connect( item_focused )
	focus_exited.connect( item_unfocused )
	pressed.connect(ItemPressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func SetSlotData(value : SlotData) -> void:
	slot_data = value
	if slot_data == null:
		return
	texture_rect.texture=slot_data.item.texture
	label.text=str(slot_data.quantity)
	pass

func item_focused() -> void:
	if slot_data != null:
		if slot_data.item != null:
			PauseMenu.UpdateDescription( slot_data.item.description )
	pass


func item_unfocused() -> void:
	PauseMenu.UpdateDescription( "" )
	pass

func ItemPressed() -> void:
	if slot_data:
		if slot_data.item:
			var wasused = slot_data.item.use()
			if wasused == false:
				return
			slot_data.quantity -= 1
			label.text = str(slot_data.quantity)
	pass
