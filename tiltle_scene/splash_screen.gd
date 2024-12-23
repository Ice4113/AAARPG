extends Control

signal finished


func _ready() -> void:
	$IceLogo/AnimationPlayer.animation_finished.connect( _on_animation_finished )

func _on_animation_finished(_name : String ) -> void:
	finished.emit()
