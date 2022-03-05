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

var temp

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
	while (global.sizeArr.size() < global.levels):
		temp = global.sizeArr
		temp.push_back('')
		global.sizeArr = temp
	while (global.speedArr.size() < global.levels):
		temp = global.speedArr
		temp.push_back('')
		global.speedArr = temp
	while (global.styleArr.size() < global.levels):
		temp = global.styleArr
		temp.push_back('')
		global.styleArr = temp
	while (global.shapeArr.size() < global.levels):
		temp = global.shapeArr
		temp.push_back('')
		global.shapeArr = temp
	while (global.colorArr.size() < global.levels):
		temp = global.colorArr
		temp.push_back('')
		global.colorArr = temp
	while (global.orientArr.size() < global.levels):
		temp = global.orientArr
		temp.push_back('')
		global.orientArr = temp
	while (global.OsizeArr.size() < global.levels):
		temp = global.OsizeArr
		temp.push_back('')
		global.OsizeArr = temp
	while (global.OspeedArr.size() < global.levels):
		temp = global.OspeedArr
		temp.push_back('')
		global.OspeedArr = temp
	while (global.OstyleArr.size() < global.levels):
		temp = global.OstyleArr
		temp.push_back('')
		global.OstyleArr = temp
	while (global.OshapeArr.size() < global.levels):
		temp = global.OshapeArr
		temp.push_back('')
		global.OshapeArr = temp
	while (global.OcolorArr.size() < global.levels):
		temp = global.OcolorArr
		temp.push_back('')
		global.OcolorArr = temp
	while (global.OorientArr.size() < global.levels):
		temp = global.OorientArr
		temp.push_back('')
		global.OorientArr = temp
	for k1 in global.levels:
		if global.sizeArr[k1] == '':
			global.sizeArr[k1] = 'large'
		if global.speedArr[k1] == '':
			global.speedArr[k1] = 'zero'
		if global.styleArr[k1] == '':
			global.styleArr[k1] = 'straight'
		if global.shapeArr[k1] == '':
			global.shapeArr[k1] = 'sphere'
		if global.colorArr[k1] == '':
			global.colorArr[k1] = '001'
		if global.orientArr[k1] == '':
			global.orientArr[k1] = 'x'
		if global.OsizeArr[k1] == '':
			global.OsizeArr[k1] = 'zero'
		if global.OspeedArr[k1] == '':
			global.OspeedArr[k1] = 'zero'
		if global.OstyleArr[k1] == '':
			global.OstyleArr[k1] = 'straight'
		if global.OshapeArr[k1] == '':
			global.OshapeArr[k1] = 'sphere'
		if global.OcolorArr[k1] == '':
			global.OcolorArr[k1] = '000'
		if global.OorientArr[k1] == '':
			global.OorientArr[k1] = 'x'
	if !checkPresence(global.orientArr, expectedOrients) or !checkPresence(global.colorArr, expectedColors) or !checkPresence(global.shapeArr, expectedShapes) or !checkPresence(global.sizeArr, expectedSizes) or !checkPresence(global.speedArr, expectedSpeeds) or !checkPresence(global.styleArr, expectedStyles):
		num = 1
		$"../RichTextLabel5".text = "Unexpected value(s) in parameters"
	#if global.orientArr.size() != global.levels or global.colorArr.size() != global.levels or global.shapeArr.size() != global.levels or global.sizeArr.size() != global.levels or global.speedArr.size() != global.levels or global.styleArr.size() != global.levels:
	#	num = 1
	#	$"../RichTextLabel5".text = "Mismatch between the number of levels and the number of parameter values"
	if !checkPresence(global.OorientArr, OexpectedOrients) or !checkPresence(global.OcolorArr, OexpectedColors) or !checkPresence(global.OshapeArr, OexpectedShapes) or !checkPresence(global.OsizeArr, OexpectedSizes) or !checkPresence(global.OspeedArr, OexpectedSpeeds) or !checkPresence(global.OstyleArr, OexpectedStyles):
		num = 1
		$"../RichTextLabel5".text = "Unexpected value(s) in parameters"
	#if global.OorientArr.size() != global.levels or global.OcolorArr.size() != global.levels or global.OshapeArr.size() != global.levels or global.OsizeArr.size() != global.levels or global.OspeedArr.size() != global.levels or global.OstyleArr.size() != global.levels:
	#	num = 1
	#	$"../RichTextLabel5".text = "Mismatch between the number of levels and the number of parameter values"

	if num == 0:
		global.midScrnText = "Click 'Next Level' to start the first level."
		global.nextLevelVis = true
		get_tree().change_scene("res://MidScreen.tscn")
