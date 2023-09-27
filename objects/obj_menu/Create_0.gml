/// @description Init

// Some values that will be reused with a certain frequency
#macro OFFSET 64
#macro GUI_WIDTH display_get_gui_width()
#macro GUI_HEIGHT display_get_gui_height()

// Selected button
selected = 0;

// Mouse positions
mouse_pos = new Vector2();
old_mouse_pos = new Vector2();