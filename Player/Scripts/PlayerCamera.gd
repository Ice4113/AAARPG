class_name PlayerCamera extends Camera2D

@export_range(0, 1, 0.05 , "or_greater") var shake_power : float = 0.5
@export var shake_max_offset : float = 5.0 
@export var shake_decay : float = 1.0
var shake_trauma : float = 0.0


func _ready():
	LevelManager.TileMapBoundsChanged.connect(UpdateLimits)
	UpdateLimits(LevelManager.current_tilemapbounds)
	PlayerManager.camera_shook.connect(add_camera_shaked)
	pass

func _physics_process(delta: float) -> void:
	if shake_trauma > 0:
		shake_trauma = max(shake_trauma - shake_trauma * delta,0)
		shake()


func add_camera_shaked(val : float) -> void:
	shake_trauma = val
	pass

func shake() -> void:
	var amount : float = pow(shake_trauma * shake_power,2)
	offset = Vector2(randf_range(-1,1),randf_range(-1,1)) * shake_max_offset * amount
	pass



func UpdateLimits( bounds : Array[ Vector2 ] ) -> void:
	if bounds == []:
		return
	limit_left = int(bounds[0].x)
	limit_top = int(bounds[0].y)
	limit_right = int(bounds[1].x)
	limit_bottom = int(bounds[1].y)
	pass
