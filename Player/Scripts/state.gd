class_name State extends Node

static var player: Player
static var state_machine :PlayerStateMachine

func _ready():
	pass

func init() -> void:
	pass

##Player input
func Enter() -> void:
	pass

##What happen when player exit state
func Exit() -> void:
	pass

##What happen during process update
func process(_delta : float) -> State:
	return null

##What happen during _physics_progress update
func Physics(_delta : float) -> State:
	return null


func HandleInput( _event: InputEvent) -> State:
	return null
