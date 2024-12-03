class_name EnemyStateStun extends EnemyState

@export_category("AI")
@export var anim_name : String = "stun"
@export var knockback_speed : float = 200.0
@export var decelerate_speed : float = 10.0

@export var next_state : EnemyState

var _damaged_position : Vector2
var _direction : Vector2
var _animation_finished : bool = false

func init() -> void:
	enemy.enemy_damaged.connect(_on_enemy_damaged)
	pass


func enter() -> void:
	_animation_finished = false
	enemy.invulnerable = true
	_direction = enemy.global_position.direction_to(_damaged_position)
	enemy.SetDirection( _direction )
	enemy.velocity = _direction * -knockback_speed
	
	enemy.UpdateAnimation( anim_name )
	enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass

func exit() -> void:
	enemy.invulnerable = false
	enemy.animation_player.animation_finished.disconnect(_on_animation_finished)
	pass

func processs(_delta : float) -> EnemyState:
	if _animation_finished == true:
		return next_state
	enemy.velocity -= enemy.velocity * decelerate_speed * _delta
	return null

func physics(_delta : float) -> EnemyState:
	return null

func _on_enemy_damaged(hurt_box : HurtBox) -> void:
	_damaged_position = hurt_box.global_position
	state_machine.ChangeState(self)
	pass

func _on_animation_finished(_a : String) -> void:
	_animation_finished = true
	pass
