extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed : float = 20
export var acceleration : float = 8
export var air_acceleration : float = 3
export var gravity : float = 0.98
export var max_terminal_velocity : float = 54
export var jump_power : float = 20
var velocity : Vector3
var y_velocity : float
onready var robot = $"MeshInstance"
var rng = RandomNumberGenerator.new()

export(float, 0.1, 1) var mouse_sensitivity : float = 0.3
export(float, -90, 0) var min_pitch : float = -90
export(float, 0, 90) var max_pitch : float = 90

var counter
onready var camera_pivot = $Spatial
var Bullet = preload("res://Bullet.tscn")
var arr = ["../StaticBody2", "../StaticBody3", "../StaticBody4", "../StaticBody5", "../StaticBody6"]
var Oarr = ["../StaticBody7", "../StaticBody8", "../StaticBody9", "../StaticBody10", "../StaticBody11"]
# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	var material = SpatialMaterial.new()
	var Omaterial = SpatialMaterial.new()
	for i in arr:
		delete_children(get_node(i))
	if global.shapeArr[global.currCounter] == "sphere":
		for i in arr:
			get_node(i).mesh = SphereMesh.new()
	if global.shapeArr[global.currCounter] == "capsule":
		for i in arr:
			get_node(i).mesh = CapsuleMesh.new()
	if global.shapeArr[global.currCounter] == "prism":
		for i in arr:
			get_node(i).mesh = PrismMesh.new()
	if global.shapeArr[global.currCounter] == "cube":
		for i in arr:
			get_node(i).mesh = CubeMesh.new()
	if global.shapeArr[global.currCounter] == "cylinder":
		for i in arr:
			get_node(i).mesh = CylinderMesh.new()
	if global.colorArr[global.currCounter] == "000":
		material.albedo_color = Color(0, 0, 0)
	if global.colorArr[global.currCounter] == "001":
		material.albedo_color = Color(0, 0, 1)
	if global.colorArr[global.currCounter] == "010":
		material.albedo_color = Color(0, 1, 0)
	if global.colorArr[global.currCounter] == "011":
		material.albedo_color = Color(0, 1, 1)
	if global.colorArr[global.currCounter] == "100":
		material.albedo_color = Color(1, 0, 0)
	if global.colorArr[global.currCounter] == "101":
		material.albedo_color = Color(1, 0, 1)
	if global.colorArr[global.currCounter] == "110":
		material.albedo_color = Color(1, 1, 0)
	if global.colorArr[global.currCounter] == "111":
		material.albedo_color = Color(1, 1, 1)
	for i in arr:
		get_node(i).set_surface_material(0, material)
	if global.sizeArr[global.currCounter] == "large":
		for i in arr:
			get_node(i).scale = Vector3(7.5, 7.5, 7.5)
	if global.sizeArr[global.currCounter] == "tiny":
		for i in arr:
			get_node(i).scale = Vector3(2.5, 2.5, 2.5)
	for i in arr:
		get_node(i).create_trimesh_collision()
	for i in Oarr:
		delete_children(get_node(i))
	if global.OshapeArr[global.currCounter] == "sphere":
		for i in Oarr:
			get_node(i).mesh = SphereMesh.new()
	if global.OshapeArr[global.currCounter] == "capsule":
		for i in Oarr:
			get_node(i).mesh = CapsuleMesh.new()
	if global.OshapeArr[global.currCounter] == "prism":
		for i in Oarr:
			get_node(i).mesh = PrismMesh.new()
	if global.OshapeArr[global.currCounter] == "cube":
		for i in Oarr:
			get_node(i).mesh = CubeMesh.new()
	if global.OshapeArr[global.currCounter] == "cylinder":
		for i in Oarr:
			get_node(i).mesh = CylinderMesh.new()
	if global.OcolorArr[global.currCounter] == "000":
		Omaterial.albedo_color = Color(0, 0, 0)
	if global.OcolorArr[global.currCounter] == "001":
		Omaterial.albedo_color = Color(0, 0, 1)
	if global.OcolorArr[global.currCounter] == "010":
		Omaterial.albedo_color = Color(0, 1, 0)
	if global.OcolorArr[global.currCounter] == "011":
		Omaterial.albedo_color = Color(0, 1, 1)
	if global.OcolorArr[global.currCounter] == "100":
		Omaterial.albedo_color = Color(1, 0, 0)
	if global.OcolorArr[global.currCounter] == "101":
		Omaterial.albedo_color = Color(1, 0, 1)
	if global.OcolorArr[global.currCounter] == "110":
		Omaterial.albedo_color = Color(1, 1, 0)
	if global.OcolorArr[global.currCounter] == "111":
		Omaterial.albedo_color = Color(1, 1, 1)
	for i in Oarr:
		get_node(i).set_surface_material(0, Omaterial)
	if global.OsizeArr[global.currCounter] == "large":
		for i in Oarr:
			get_node(i).scale = Vector3(7.5, 7.5, 7.5)
	if global.OsizeArr[global.currCounter] == "tiny":
		for i in Oarr:
			get_node(i).scale = Vector3(2.5, 2.5, 2.5)
	if global.OsizeArr[global.currCounter] == "zero":
		for i in Oarr:
			get_node(i).translation.z = 100
	for i in Oarr:
		get_node(i).create_trimesh_collision()

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)




func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		camera_pivot.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		camera_pivot.rotation_degrees.x = clamp(camera_pivot.rotation_degrees.x, min_pitch, max_pitch)
		
		
func _physics_process(delta):
	counter += 1
	handle_movement(delta)


func handle_movement(delta):
	var direction = Vector3()
	var is_moving = false
	
	if Input.is_action_pressed("move_fw"):
		direction -= transform.basis.z
		is_moving = true

	if Input.is_action_pressed("move_bw"):
		direction += transform.basis.z
		is_moving = true

	if Input.is_action_pressed("move_l"):
		direction -= transform.basis.x
		is_moving = true

	if Input.is_action_pressed("move_r"):
		direction += transform.basis.x
		is_moving = true

	direction = direction.normalized()
	
	var accel = acceleration if is_on_floor() else air_acceleration
	velocity = velocity.linear_interpolate(direction * speed, accel * delta)
	
	if is_on_floor():
		y_velocity = -0.01
	else:
		y_velocity = clamp(y_velocity - gravity, -max_terminal_velocity, max_terminal_velocity)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		y_velocity = jump_power
	
	velocity.y = y_velocity
	velocity = move_and_slide(velocity, Vector3.UP)

	if is_moving:
		var angle = transform.origin - velocity
		robot.look_at(angle, Vector3.UP)
		
func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		var b = Bullet.instance()
		b.start($"Spatial/Camera/Position3D".global_transform)
		get_parent().add_child(b)
	if event.is_action_pressed("backMenu"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Menu.tscn")

