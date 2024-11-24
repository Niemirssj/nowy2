class_name PlayerInteractionsHost extends Node2D
@onready var character_body_2d: Player = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character_body_2d.direction_changed.connect( UpdateDirection )
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func UpdateDirection( new_direction : Vector2) -> void:
	match new_direction:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 0
		Vector2.LEFT:
			rotation_degrees = 240
		Vector2.RIGHT:
			rotation_degrees = 0
		_:
			rotation_degrees = 0
	pass
