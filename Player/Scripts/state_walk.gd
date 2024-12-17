class_name State_Stun extends State

@export var move_speed : float = 100.0

@onready var idle: State = $"../Idle"
@onready var attack: State =$"../Attack"
##Player input
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

##What happen when player exit state
func Exit() -> void:
	pass

##What happen during process update
func process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	return null

##What happen during _physics_progress update
func Physics(_delta : float) -> State:
	return null


func HandleInput( _event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	if _event.is_action_pressed("interact"):
		PlayerManager.interact_pressed.emit()
	return null
