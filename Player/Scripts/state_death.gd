class_name State_Death extends State

@export var exhaust_audio : AudioStream
@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"


func _ready():
	pass

func init() -> void:
	pass

##Player input
func Enter() -> void:
	player.animation_player.play("death")
	audio.stream = exhaust_audio
	audio.play()
	PlayerHud.show_game_over_screen()
	AudioManager.play_music(null)
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
