class_name State_Attack extends State

var atak : bool = false
@onready var animation_player : AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var animation_player2: AnimationPlayer = $"../../AnimationPlayer"

@onready var idle : State = $"../Idle"
@onready var walk : State = $"../Walk"
@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@export var attack_sound : AudioStream
@onready var hurt_box: HurtBox = $"../../Interactions/HurtBox"

func Enter() -> void:
	player.UpdateAnimation("attack")
	
	animation_player.animation_finished.connect(EndAttack)
	animation_player2.animation_finished.connect(EndAttack2)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	atak = true
	
	await get_tree().create_timer(0.075).timeout
	hurt_box.monitoring = true
	pass

func Exit() -> void:
	atak = false
	animation_player.animation_finished.disconnect(EndAttack)
	animation_player2.animation_finished.disconnect(EndAttack2)
	hurt_box.monitoring = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(delta: float) -> State:
	player.velocity = Vector2.ZERO
	
	if atak == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

func Physics(delta: float) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	return null

func EndAttack( ) -> void:
	print("atakuje")
	atak=false
	
func EndAttack2(_animation_name: String ) -> void:
	print("atakuje")
	atak=false
