class_name ItemEffectHeal extends ItemEffect

@export var heal_mount : int = 1
@export var sound : AudioStream

func use() -> void:
	PlayerManager.player.update_hp(heal_mount)
	PauseMenu.PlaySound(sound)
	pass
