class_name EnemyStateWander extends EnemyState

@export var anim_name :String = "walk"
@export var wander_speed :float = 20.0

@export_category("AI")
@export var state_animation_duration : float = 0.5
@export var state_cycles_min : int = 1
@export var state_cycles_max : int = 3
@export var next_state : EnemyState

var _timer : float =0.0
var _direction : Vector2

func init() -> void:
	pass

func enter() -> void:
	_timer = randf_range(state_cycles_min,state_cycles_max) * state_animation_duration
	var rand = randi_range(0 , 3)
	_direction = enemy.DIR_4[ rand ]
	enemy.velocity = _direction * wander_speed
	enemy.SetDirection(_direction)
	enemy.update_animation(anim_name)
	pass

##What happen when player exit state
func exit() -> void:
	pass

##What happen during process update
func process(_delta : float) -> EnemyState:
	_timer -= _delta
	if _timer < 0:
		return next_state
	return null

##What happen during _physics_progress update
func physics(_delta : float) -> EnemyState:
	return null