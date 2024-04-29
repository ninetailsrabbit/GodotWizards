class_name BBCodeWizard


static func add_outline(text: String, size: int) -> String:
	return "[outline_size=" + str(size) + "]" + text + "[/outline_size]"


static func add_outline_color(text: String, color: Color) -> String:
	return "[outline_color=" + color.to_html(true) + "]" + text + "[/outline_color]"


static func add_color(text: String, color: Color) -> String:
	return "[color=" + color.to_html(true) + "]" + text + "[/color]"


static func add_bg_color(text: String, color: Color) -> String:
	return "[bgcolor=" + color.to_html(true) + "]" + text + "[/bgcolor]"


static func add_fg_color(text: String, color: Color) -> String:
	return "[fgcolor=" + color.to_html(true) + "]" + text + "[/fgcolor]"


static func add_image(path: String, color: Color = Color.WHITE) -> String:
	return "[img color=" + color.to_html(true) + "]" + path + "[/img]"


static func add_bold(text: String) -> String:
	return "[b]" + text + "[/b]"


static func add_italic(text: String) -> String:
	return "[i]" + text + "[/i]"


static func add_underline(text: String) -> String:
	return "[u]" + text + "[/u]"


static func add_strikethrough(text: String) -> String:
	return "[s]" + text + "[/s]"

