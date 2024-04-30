extends Node

signal frame_freezed_started
signal frame_freezed_finished


func mouse_screen_position() -> Vector2:
	return get_viewport().get_mouse_position()


func mouse_screen_relative_position() -> Vector2:
	return mouse_screen_position() / Vector2(get_tree().root.size)
	
	
func mouse_position_from_center() -> Vector2:
	var window_center := get_tree().root.size / 2
	
	return Vector2(window_center) - mouse_screen_position()


func mouse_relative_from_center() -> Vector2:
	var window_size := get_tree().root.size
	var window_center := window_size / 2
	
	return (Vector2(window_center) - mouse_screen_position()) / Vector2(window_size)
	
	
## Useful to fix mouse handling when viewport it's stretched
func final_transform() -> Transform2D:
	return get_tree().root.get_final_transform()


func generate_random_id_from_unix_time()-> String:
	return "%s%s" % [Time.get_unix_time_from_system () * 1000, (100 + randi() % 899 + 1)]


## On iOS this method doesn't work. 
## Instead, as recommended by the iOS Human Interface Guidelines, the user is expected to close apps via the Home button
func quit_game(exit_code: int = 0) -> void:
	if OS.get_name() != "iOS":
		get_tree().quit(exit_code)

## https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html
func pause_game():
	if not get_tree().paused:
		get_tree().paused = true


func resume_game():
	if get_tree().paused:
		get_tree().paused = false


func is_mobile() -> bool:
	if not OS.has_feature("web"):
		return false
	
	return JavaScriptBridge.eval("/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)", true)


func is_multithreading_enabled() -> bool:
	return ProjectSettings.get_setting("rendering/driver/threads/thread_model") == 2


func start_frame_freeze(time_scale: float, duration: float, scale_audio: bool = true) -> void:
	frame_freezed_started.emit()
	
	var original_time_scale_value := Engine.time_scale
	var original_playback_speed_scale = AudioServer.playback_speed_scale
	
	Engine.time_scale = time_scale
	
	if scale_audio:
		AudioServer.playback_speed_scale = time_scale
	
	await get_tree().create_timer(duration, true, false, true).timeout
	
	Engine.time_scale = original_time_scale_value
	AudioServer.playback_speed_scale = original_playback_speed_scale
	
	frame_freezed_finished.emit()

	
func open_external_link(url: String) -> void:
	if StringWizard.is_valid_url(url) and OS.has_method("shell_open"):
		if OS.get_name() == "Web":
			url = url.uri_encode()
			
		OS.shell_open(url)


func random_enum(_enum):
	return _enum.keys()[randi() % _enum.size()]
	
	
func get_texture_dimensions(texture: Texture2D) -> Rect2i:
	return texture.get_image().get_used_rect()
	
	
func get_texture_rect_dimensions(texture_rect: TextureRect) -> Vector2:
	var texture: Texture2D = texture_rect.texture
	var used_rect := get_texture_dimensions(texture)
	var texture_dimensions := Vector2(used_rect.size) * texture_rect.scale

	return texture_dimensions


func get_sprite_dimensions(sprite: Sprite2D) -> Vector2:
	var texture: Texture2D = sprite.texture
	var used_rect := get_texture_dimensions(texture)
	var sprite_dimensions := Vector2(used_rect.size) * sprite.scale

	return sprite_dimensions


static func get_png_rect_from_texture(texture: Texture2D) -> Rect2i:
	var image = texture.get_image()
	
	assert(image is Image, "Utilities->get_png_rect_from_texture: The image from the texture is null, the texture it's invalid")
	
	var top_position := image.get_height()
	var bottom_position := 0
	
	var right_position := image.get_width()
	var left_position := 0
	
	for x in image.get_width():
		for y in image.get_height():
			var pixel_color: Color = image.get_pixel(x, y)
			
			if pixel_color.a:
				if top_position > y:
					top_position = y
					
				if bottom_position < y:
					bottom_position = y
				
				if right_position > x:
					right_position = x
					
				if left_position < x:
					left_position = x
	
	var position := Vector2i(left_position - right_position,  bottom_position - top_position)
	var size := Vector2i(right_position + roundi(position.x / 2.0),  top_position + roundi(position.y / 2.0))
	
	return Rect2i(position, size)
	
	
	
func screenshot(viewport: Viewport = get_viewport()) -> Image:
	return viewport.get_texture().get_image()
	
	
func screenshot_to_texture_rect(texture_rect: TextureRect = TextureRect.new(), viewport: Viewport = get_viewport()) -> TextureRect:
	var img = screenshot(viewport)
	
	assert(img is Image, "Utilities-screenshot_to_texture_rect: The image output is null")
	
	#img.flip_y()
	texture_rect.texture = ImageTexture.create_from_image(img)
	
	return texture_rect

## Consider exploring alternative color difference metrics like Delta-E or CIELAB if precise color matching is crucial
func colors_are_similar(color_a: Color, color_b: Color, tolerance := 100.0) -> bool:
	var v1 := Vector4(color_a.r, color_a.g, color_a.b, color_a.a)
	var v2 := Vector4(color_b.r, color_b.g, color_b.b, color_b.a)

	return v2.distance_to(v1) <= (tolerance / 255.0)


## Example with lambda -> Utilities.delay_func(func(): print("test"), 1.5)
## Example with arguments -> Utilities.delay_func(print_text.bind("test"), 2.0)
func delay_func(callable: Callable, time: float, deferred: bool = true):
	if callable.is_valid():
		await get_tree().create_timer(time).timeout
		
		if deferred:
			callable.call_deferred()
		else:
			callable.call()
