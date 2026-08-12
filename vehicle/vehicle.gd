class_name Vehicle
extends CharacterBody3D

var _controller: VehicleController
@onready var steering: VehicleSteering = $Components/VehicleSteering
@onready var throttle: VehicleThrottle = $Components/VehicleThrottle


func _init(controller: VehicleController) -> void:
	_controller = controller

func _physics_process(delta: float) -> void:
	_controller.poll()
	
	steering.update(delta, _controller.steer_axis)
	throttle.update(delta, _controller.throttle_axis)
	
	move_and_slide()
