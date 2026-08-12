class_name PlayerController
extends VehicleController

func poll():
	steer_axis = Input.get_axis(&"steer_left", &"steer_right")
	throttle_axis = Input.get_axis(&"brake", &"accelerate")
