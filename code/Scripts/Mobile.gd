extends CanvasLayer
var right = false
var left = false
var mobile = false
export var jump = false
func _ready():
	if OS.has_touchscreen_ui_hint():
		$Left.show()
		$Right.show()
		$Jump.show()
