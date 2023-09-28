/// @description Process

// Self destruct
if (x <= -128) instance_destroy(self);

// Pause 
hspeed = (global.speed > 0) ? -spd - global.score * .1 : global.speed;

if (instance_exists(obj_player)) {
	// Increase player score
	if (obj_player.x > x && can_give_point) {
		global.score++;
		can_give_point = false;
	}

	// Col
	var _col = point_in_triangle(	obj_player.x, obj_player.y,
									x - 128, y + (( y <= room_height / 2) ? 0 : 256),
									x, y + (( y >= room_height / 2) ? -32 : 272),
									x + 128, y + (( y <= room_height / 2) ? 0 : 256));

	if (_col && !instance_exists(obj_popup)) {
		// Destroy player
		instance_destroy(obj_player);
		
		// Game over popup
		instance_create_layer(x, y, "PopUP", obj_popup, global.game_over_popup);
	}
}