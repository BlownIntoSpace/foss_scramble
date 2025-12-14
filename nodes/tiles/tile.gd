extends StaticBody2D

signal dragging_tile;

var dragging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("dragging_tile",_set_drag_pc)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func set_character(character : String):
	$LetterLabel.text = character

func set_value(value : int):
	$ScoreLabel.text = str(value)
	
func _set_drag_pc():
	dragging = !dragging


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("dragging_tile")
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			emit_signal("dragging_tile")
			
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.position()
