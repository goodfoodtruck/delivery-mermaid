class_name PlayerController
extends VehicleController

func poll():
	steer_axis = Input.get_axis(&"steer_right", &"steer_left")
	throttle_axis = Input.get_axis(&"brake", &"accelerate")
