// Vector2
function Vector2(_x = 0, _y = 0) constructor {
	// Positions
	x = _x;
	y = _y;
	
	// Set positions
	function set(_x, _y) { x = _x; y = _y; }
	
	// Comapre with other vector
	function compare(_vector) { return (x == _vector.x && y == _vector.y); }
}

function Vector3(_x = 0, _y = 0, _z = 0) constructor {
	// Positions
	x = _x;
	y = _y;
	z = _z;
	
	// Set positions
	function set(_x, _y, _z) { x = _x; y = _y; z = _z; }
	
	// Comapre with other vector
	function compare(_vector) { return (x == _vector.x && y == _vector.y && z ==_vector.z); }
}

// Vector 2²
function Vector4(_l = 0, _u = 0, _r = 0, _d = 0) constructor {
	// Positions
	l = _l;
	u = _u;
	r = _r;
	d = _d;
	
	// Set positions
	function set(_l, _u, _r, _d) { l = _l; u = _u; r = _r; d = _d; }
	
	// Comapre with other vector
	function compare(_vector) { return (l == _vector.l && u == _vector.u && r == _vector.r && d == vector.d); }
}