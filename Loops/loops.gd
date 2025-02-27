extends Node2D
@export var spawn_count: int = 200
var star_scene = preload("res://Loops/star.tscn")

func _ready() -> void:
	for i in spawn_count:
		var star = star_scene.instantiate()
		add_child(star)
		star.position = Vector2(randi_range(-290, 290), randi_range(-170, 170))
		#star.position.x = randi_range(-290, 290)
		#star.position.y = randi_range(-170, 170)
		
		#var star_size: float = randf_range(0.2, 1)
		star.scale *= randf_range(0.2, 1.0)
		#star.scale.x = star_size
		#star.scale.y = star_size

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		_take_screenshot()

func _take_screenshot():
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()  # Jelenet képe
	img.flip_y()  # Godot-ban a képek fejjel lefelé mentődnek, ezért megfordítjuk
	img.save_png("d://godot_screensave.png")  # PNG-ként mentés
