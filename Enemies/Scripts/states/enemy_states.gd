class_name EnemyState extends Node

var enemy :Enemy
var state_machine :EnemyStateMachine

func init() -> void:
	pass

func enter() -> void:
	pass

##What happen when player exit state
func exit() -> void:
	pass

##What happen during process update
func process(_delta : float) -> EnemyState:
	return null

##What happen during _physics_progress update
func physics(_delta : float) -> EnemyState:
	return null
