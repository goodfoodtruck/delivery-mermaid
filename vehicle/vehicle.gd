class_name Vehicle
extends CharacterBody3D

var _controller: VehicleController
@onready var steering: VehicleSteering = $Components/VehicleSteering
@onready var engine: VehicleEngine = $Components/VehicleEngine


func _init(controller: VehicleController) -> void:
	_controller = controller


func _physics_process(delta: float) -> void:
	_controller.poll()
	
	steering.update(delta, _controller.steer_axis)
	engine.update(delta, _controller.throttle_axis)
	
	rotate_y(steering.get_yaw_delta(delta, engine.speed, engine.max_speed))
	
	velocity = -global_basis.z * engine.speed
	
	move_and_slide()
