extends Node2D
@export var spawn_count: int = 256
var star_scene = preload("res://Loops/star.tscn")
var picture_number = 1 # to iterate screenshot name

func _ready() -> void:
	_start_spawner()

func _process(delta: float) -> void:
	# press Space to make a screenshot
	if Input.is_action_just_pressed("screenshot"):
		_take_screenshot()

func _start_spawner():
	for i in spawn_count:
		var star = star_scene.instantiate()
		add_child(star)
		star.position = Vector2(randi_range(-960, 960), randi_range(-540, 540))
		star.scale *= randf_range(0.2, 1.4)
		await get_tree().create_timer(0.02).timeout #wait a bit for the next iteration

func _take_screenshot():
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	img.flip_y()
	var pic_path_name = str("d://godot_screensave", picture_number, ".png")
	img.save_png(pic_path_name)
	picture_number += 1
