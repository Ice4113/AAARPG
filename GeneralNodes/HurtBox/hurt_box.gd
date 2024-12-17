class_name HurtBox extends Area2D

@export var damage : int = 1

func _ready():
	area_entered.connect( Area_entered )
	pass

func _progress(_delta):
	pass

func Area_entered( a :Area2D) -> void:
	if a is HitBox:
		a.TakeDamage( self )
	pass 
