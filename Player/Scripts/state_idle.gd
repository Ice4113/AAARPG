class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"
 
##Player input
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

##What happen when player exit state
func Exit() -> void:
	pass

##What happen during process update
func process(_delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

##What happen during _physics_progress update
func Physics(_delta : float) -> State:
	return null


func HandleInput( _event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	if _event.is_action("interact"):
		PlayerManager.interact_pressed.emit()
	return null
