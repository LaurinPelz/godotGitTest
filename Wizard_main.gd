extends Area2D

var MOVEMENT_VEKTOR = 1
var mouse_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	return false

func check_y_position(point: Vector2):
	return point.y == position.y
	
func check_x_position(point: Vector2):
	return point.x == position.x

func check_rotiation(point: Vector2):
	return (get_angle_to(point) == 0) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("right_click"):
		mouse_position = get_global_mouse_position()
	if check_rotiation(mouse_position):
		position = position.move_toward(mouse_position, 10)
	else:
		if !(check_x_position(mouse_position) && check_y_position(mouse_position)):
			rotation = lerpf(get_angle_to(mouse_position), 0, delta * 5) 
	print(get_angle_to(mouse_position))
