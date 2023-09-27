function Clickable(_pos = new Vector2(), _size = new Vector2(64, 20)) constructor {
	
	// Vars
	pos = _pos;
	size = _size;
	
	// Create a 2² array
	lurd = new Vector4(pos.x - size.x * .5, pos.y - size.y * .5, pos.x + size.x * .5, pos.y + size.y * .5);
	
	// Set transformation
	function set_transform(_pos, _size) {
		pos = _pos;
		size = _size;
	}
	
	// Draw debug rectangles
	function draw_debug() {
		draw_rectangle(lurd.l, lurd.u, lurd.r, lurd.d, false);
	}
	
	// Detect collision
	function detect_collision(_pos) {
		return point_in_rectangle(_pos.x, _pos.y, lurd.l, lurd.u, lurd.r, lurd.d);
	}
}