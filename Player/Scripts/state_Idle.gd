class_name State_Idle extends State

@onready var walk : State= $"../Walk"

func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

func Exit() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk;
	player.velocity=Vector2.ZERO
	return null

func Physics(delta: float) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	return null
