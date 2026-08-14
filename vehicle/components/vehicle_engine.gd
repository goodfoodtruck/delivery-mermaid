class_name VehicleEngine
extends Node

@export var acceleration := 20.0
@export var deceleration := 30.0
@export var engine_drag := 6.0
@export var max_speed := 100.0
@export var max_reverse_speed := 20.0

@onready var speed := 0.0

func update(delta: float, axis: float) -> void:
	if is_zero_approx(axis):
		speed = move_toward(speed, 0.0, engine_drag * delta)
	elif not is_zero_approx(speed) and signf(axis) != signf(speed):
		speed = move_toward(speed, 0.0, deceleration * delta)
	else:
		var target := max_speed if axis > 0.0 else -max_reverse_speed
		speed = move_toward(speed, target, acceleration * delta)
