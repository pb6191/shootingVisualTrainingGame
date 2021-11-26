extends RayCast


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ray_length = 1000000
var arr = ["StaticBody2", "StaticBody3", "StaticBody4", "StaticBody5", "StaticBody6"]
var numBodies = arr.size()
var totalTime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	totalTime += delta
	get_node(".").cast_to = Vector3(0,0,-1) * ray_length
	if Input.is_action_just_pressed("shoot"):
		if get_node(".").get_collider() != null:
			if get_node(".").get_collider().get_parent().get_name() in arr:
				get_node(".").get_collider().get_parent().visible = false
				get_node(".").get_collider().get_parent().translation.z = 200
				numBodies -=1
				if (global.currCounter < global.levels-1 and numBodies <=0):
					global.currCounter = global.currCounter+1
					numBodies = arr.size()
					totalTime = 0
					global.midScrnText = "Congratulations! You hit all the targets."
					global.nextLevelVis = true
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					get_tree().change_scene("res://MidScreen.tscn")
				if (global.currCounter == global.levels-1 and numBodies <=0):
					global.currCounter = 0
					numBodies = arr.size()
					totalTime = 0
					global.midScrnText = "Game Over."
					global.nextLevelVis = false
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					get_tree().change_scene("res://MidScreen.tscn")
	if (global.currCounter < global.levels-1 and totalTime > 600.0):
		global.currCounter = global.currCounter+1
		numBodies = arr.size()
		totalTime = 0
		global.midScrnText = "You reached the 10 minutes limit for this level."
		global.nextLevelVis = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://MidScreen.tscn")
	if (global.currCounter == global.levels-1 and totalTime > 600.0):
		global.currCounter = 0
		numBodies = arr.size()
		totalTime = 0
		global.midScrnText = "Game Over."
		global.nextLevelVis = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://MidScreen.tscn")
