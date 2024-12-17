class_name HitBox extends Area2D

signal Damaged (hurt_box :HurtBox)

@export var damage : int = 1

func _ready():
	pass

func _process(_delta):
	pass

func TakeDamage( hurt_box : HurtBox ) -> void:
	Damaged.emit(hurt_box)
