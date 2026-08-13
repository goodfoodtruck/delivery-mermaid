class_name VehicleSteering
extends Node

@onready var _max_steering_angle := deg_to_rad(35.0)
@onready var _steering_speed := deg_to_rad(180.0)
@onready var _return_speed := deg_to_rad(260.0)

@onready var _steering_angle := 0.0


func update(delta: float, axis: float) -> void:
	var target := clampf(axis, -1.0, 1.0) * _max_steering_angle
	var rate := _steering_speed if not is_zero_approx(axis) else _return_speed
	_steering_angle = move_toward(_steering_angle, target, rate * delta)


func get_yaw_delta(delta: float, speed: float, max_speed: float) -> float:
	return _steering_angle * (speed / max_speed) * delta
