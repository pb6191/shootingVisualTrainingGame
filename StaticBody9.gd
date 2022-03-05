extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var targetSpeed = 0
var targetDir = "right"
var initY
var initX
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$".".translation.x = rng.randi_range(-10,10)
	rng.randomize()
	$".".translation.y = rng.randi_range(0,20)
	if global.OspeedArr[global.currCounter] == "slow":
		targetSpeed = 10
	if global.OspeedArr[global.currCounter] == "fast":
		targetSpeed = 20
	initX = $".".translation.x
	initY = $".".translation.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if global.OorientArr[global.currCounter] == "x":
		if $".".translation.x <= 10 and targetDir == "right":
			$".".translation.x += 0.017*targetSpeed
		if $".".translation.x >= -10 and targetDir == "left":
			$".".translation.x -= 0.017*targetSpeed
		if $".".translation.x >= 10:
			targetDir = "left"
		if $".".translation.x <= -10:
			targetDir = "right"
		if global.OstyleArr[global.currCounter] == "sine":
			$".".translation.y = initY + 10*sin(0.314*$".".translation.x)
	if global.OorientArr[global.currCounter] == "y":
		if $".".translation.y <= 20 and targetDir == "right":
			$".".translation.y += 0.017*targetSpeed
		if $".".translation.y >= 0 and targetDir == "left":
			$".".translation.y -= 0.017*targetSpeed
		if $".".translation.y >= 20:
			targetDir = "left"
		if $".".translation.y <= 0:
			targetDir = "right"
		if global.OstyleArr[global.currCounter] == "sine":
			$".".translation.x = initX + 10*sin(0.314*$".".translation.y)
