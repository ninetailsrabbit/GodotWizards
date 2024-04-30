class_name CameraWizard


static func center_by_ray_origin(camera: Camera3D) -> Vector3:
	return camera.project_ray_origin(Vector2.ZERO)


static func center_by_origin(camera: Camera3D) -> Vector3:
	return camera.global_transform.origin


static func forward_direction(camera: Camera3D) -> Vector3:
	return Vector3.FORWARD.z * camera.global_transform.basis.z.normalized()
	
	
static func is_facing_camera(camera: Camera3D, node: Node) -> bool:
	return camera.global_position.dot(node.basis.z) < 0


static func get_camera2d_frame(node: Node2D) -> Rect2:
	var viewport := node.get_viewport()
	var visible_rect := viewport.get_visible_rect()
	var camera := viewport.get_camera_2d()
	
	if camera:
		visible_rect.position += camera.get_screen_center_position() - visible_rect.size / 2
		
	return visible_rect
