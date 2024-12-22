class_name State_Lift extends State

@export var lift_audio : AudioStream

@onready var carry: Node = $"../Carry"





func _ready():
	pass

func init() -> void:
	pass

##Player input
func Enter() -> void:
	player.UpdateAnimation("lift")
	player.animation_player.animation_finished.connect(state_complete)
	player.audio.stream = lift_audio
	player.audio.play()
	pass

##What happen when player exit state
func Exit() -> void:
	pass

##What happen during process update
func process(_delta : float) -> State:
	player.velocity = Vector2.ZERO
	return null

##What happen during _physics_progress update
func Physics(_delta : float) -> State:
	return null


func HandleInput( _event: InputEvent) -> State:
	return null

func state_complete(_a : String) -> void:
	player.animation_player.animation_finished.disconnect(state_complete)
	state_machine.ChangeState(carry)
	pass
