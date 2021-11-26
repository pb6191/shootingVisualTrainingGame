extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var expectedSizes = ["small", "large", "tiny"]
var expectedSpeeds = ["zero", "slow", "fast"]
var expectedStyles = ["straight", "sine"]
var expectedShapes = ["sphere", "capsule", "prism", "cube", "cylinder"]
var expectedColors = ["000", "001", "010", "011", "100", "101", "110", "111"]
var expectedOrients = ["x", "y"]

var OexpectedSizes = ["zero", "small", "large", "tiny"]
var OexpectedSpeeds = ["zero", "slow", "fast"]
var OexpectedStyles = ["straight", "sine"]
var OexpectedShapes = ["sphere", "capsule", "prism", "cube", "cylinder"]
var OexpectedColors = ["000", "001", "010", "011", "100", "101", "110", "111"]
var OexpectedOrients = ["x", "y"]

func checkPresence(arr1, arr2):
	var num2 = 0
	for i in arr1:
		if !arr2.has(i):
			num2 = 1
	if num2 == 0:
		return true
	else:
		return false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var num = 0
	global.levels = $"../SpinBox".value
	global.size = $"../LineEdit".text
	global.speed = $"../LineEdit2".text
	global.style = $"../LineEdit3".text
	global.shape = $"../LineEdit4".text
	global.color = $"../LineEdit5".text
	global.orient = $"../LineEdit11".text
	global.sizeArr = global.size.split(",")
	global.speedArr = global.speed.split(",")
	global.styleArr = global.style.split(",")
	global.shapeArr = global.shape.split(",")
	global.colorArr = global.color.split(",")
	global.orientArr = global.orient.split(",")
	global.Osize = $"../LineEdit6".text
	global.Ospeed = $"../LineEdit8".text
	global.Ostyle = $"../LineEdit9".text
	global.Oshape = $"../LineEdit10".text
	global.Ocolor = $"../LineEdit7".text
	global.Oorient = $"../LineEdit12".text
	global.OsizeArr = global.Osize.split(",")
	global.OspeedArr = global.Ospeed.split(",")
	global.OstyleArr = global.Ostyle.split(",")
	global.OshapeArr = global.Oshape.split(",")
	global.OcolorArr = global.Ocolor.split(",")
	global.OorientArr = global.Oorient.split(",")
	if !checkPresence(global.orientArr, expectedOrients) or !checkPresence(global.colorArr, expectedColors) or !checkPresence(global.shapeArr, expectedShapes) or !checkPresence(global.sizeArr, expectedSizes) or !checkPresence(global.speedArr, expectedSpeeds) or !checkPresence(global.styleArr, expectedStyles):
		num = 1
		$"../RichTextLabel5".text = "Unexpected value(s) in parameters"
	if global.orientArr.size() != global.levels or global.colorArr.size() != global.levels or global.shapeArr.size() != global.levels or global.sizeArr.size() != global.levels or global.speedArr.size() != global.levels or global.styleArr.size() != global.levels:
		num = 1
		$"../RichTextLabel5".text = "Mismatch between the number of levels and the number of parameter values"
	if !checkPresence(global.OorientArr, OexpectedOrients) or !checkPresence(global.OcolorArr, OexpectedColors) or !checkPresence(global.OshapeArr, OexpectedShapes) or !checkPresence(global.OsizeArr, OexpectedSizes) or !checkPresence(global.OspeedArr, OexpectedSpeeds) or !checkPresence(global.OstyleArr, OexpectedStyles):
		num = 1
		$"../RichTextLabel5".text = "Unexpected value(s) in parameters"
	if global.OorientArr.size() != global.levels or global.OcolorArr.size() != global.levels or global.OshapeArr.size() != global.levels or global.OsizeArr.size() != global.levels or global.OspeedArr.size() != global.levels or global.OstyleArr.size() != global.levels:
		num = 1
		$"../RichTextLabel5".text = "Mismatch between the number of levels and the number of parameter values"
	if num == 0:
		global.midScrnText = "Click 'Next Level' to start the first level."
		global.nextLevelVis = true
		get_tree().change_scene("res://MidScreen.tscn")
