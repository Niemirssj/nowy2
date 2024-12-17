extends CanvasLayer
signal shown
signal hidden

@onready var audio_stream_player: AudioStreamPlayer = $Control/AudioStreamPlayer
@onready var button_save: Button = $Control/VBoxContainer/Button_Save
@onready var button_load: Button = $Control/VBoxContainer/Button_Load
@onready var item_description: Label = $Control/ItemDescription

var is_paused : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_pause_menu()
	button_save.pressed.connect( _on_save_pressed )
	button_load.pressed.connect( _on_load_pressed )
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused == false:
			show_pause_menu()
		else:
			hide_pause_menu()
		get_viewport().set_input_as_handled()

func show_pause_menu() -> void:
	get_tree().paused=true
	visible=true
	is_paused=true
	shown.emit()

func hide_pause_menu() -> void:
	get_tree().paused=false
	visible=false
	is_paused=false
	hidden.emit()


func _on_save_pressed() -> void:
	if is_paused == false:
		pass
	SaveManager.save_game()
	hide_pause_menu()
	pass

func _on_load_pressed() -> void:
	if is_paused == false:
		pass
	SaveManager.load_game()
	await LevelManager.level_load_started
	hide_pause_menu()
	pass

func UpdateDescription( newtext : String) -> void:
	item_description.text=newtext
	pass

func PlaySound(audio : AudioStream) -> void:
	audio_stream_player.stream=audio
	audio_stream_player.play()
	pass
