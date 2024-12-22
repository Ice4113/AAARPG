class_name State_Carry extends State


@export var move_speed : float = 100.0
@export var throw_audio : AudioStream

var walking : bool = false
var throwable : Throwable

@onready var idle: State_Idle = $"../Idle"
@onready var stun: State_Walk = $"../Stun"



func _ready():
	pass

func init() -> void:
	pass

##Player input
func Enter() -> void:
	player.UpdateAnimation("carry")
	walking = false
	pass

##What happen when player exit state
func Exit() -> void:
	if throwable:
		if player.direction == Vector2.ZERO:
			throwable.throw_direction = player.cardinal_direction
		else:
			throwable.throw_direction = player.direction
		if state_machine.next_state == stun:
			throwable.throw_direction = throwable.throw_direction.rotated(PI)
			throwable.drop()
			pass
		else:
			player.audio.stream = throw_audio
			player.audio.play()
			throwable.throw()
			pass
		pass
	pass

##What happen during process update
func process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		walking = false
		player.UpdateAnimation("carry")
	elif player.SetDirection() or walking == false:
		player.UpdateAnimation("carry_walk" )
		walking = true
	player.velocity = player.direction * move_speed
	return null

##What happen during _physics_progress update
func Physics(_delta : float) -> State:
	return null


func HandleInput( _event: InputEvent) -> State:
	if _event.is_action("attack") or _event.is_action_pressed("interact"):
		return idle
	return null
