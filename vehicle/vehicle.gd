class_name Vehicle
extends CharacterBody3D

var _controller: VehicleController
@onready var steering: VehicleSteering = $Components/VehicleSteering
@onready var engine: VehicleEngine = $Components/VehicleEngine


static func create(controller: VehicleController) -> Vehicle:
	var vehicle: Vehicle = preload("res://vehicle/vehicle.tscn").instantiate()
	vehicle._controller = controller
	return vehicle


func _physics_process(delta: float) -> void:
	_controller.poll()
	
	steering.update(delta, _controller.steer_axis)
	engine.update(delta, _controller.throttle_axis)
	
	rotate_y(steering.get_yaw_delta(delta, engine.speed, engine.max_speed))
	
	velocity = -global_basis.z * engine.speed
	
	move_and_slide()
