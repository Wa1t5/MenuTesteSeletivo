/// @description Process

// Inherit the parent event
event_inherited();

// Self destruct if escape is pressed
if (keyboard_check_pressed(vk_escape)) instance_destroy(self);