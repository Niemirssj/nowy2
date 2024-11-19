class_name Player extends CharacterBody2D


var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.DOWN
@onready var animation_player : AnimatedSprite2D = $AnimatedSprite2D

@onready var state_machine: PlayeStateMachine=$StateMachine


func _ready() -> void:
	state_machine.Initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	direction.x=Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y=Input.get_action_strength("down") - Input.get_action_strength("up")
	
	pass


func _physics_process(delta: float) -> void:
	move_and_slide()
	pass


func SetDirection() -> bool:
	var new_dir: Vector2=cardinal_direction
	if direction == Vector2.ZERO:
		return false
	if direction.y == 0:
		new_dir=Vector2.LEFT if direction.x<0 else Vector2.RIGHT
	if direction.x == 0:
		new_dir=Vector2.UP if direction.y<0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	animation_player.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true


func UpdateAnimation(state: String) -> void:
	animation_player.play(state+"_"+AnimDirection())
	pass


func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		
		return "up"
	else :
		return "right"
