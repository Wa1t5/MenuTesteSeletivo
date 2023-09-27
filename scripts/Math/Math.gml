// Vector2
function Vector2(_x = 1, _y = 1) constructor {
	// Positions
	x = _x;
	y = _y;
	
	// Set positions
	function set(_x, _y) { x = _x; y = _y; }
	
	// Comapre with other vector
	function compare(_vector) { return (x == _vector.x && y == _vector.y); }
}

// Vector 2²
function Vector4(_l = 1, _u = 1, _r = 1, _d = 1) constructor {
	// Positions
	l = _l;
	u = _u;
	r = _r;
	d = _d;
}