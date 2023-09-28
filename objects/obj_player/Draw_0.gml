/// @description Draw a bird

// Set yellow color
draw_set_color(c_yellow);

// Bird base
draw_circle(x, y, 30, false);

// Bird's beak
draw_set_color(c_orange);
draw_arrow(x + 24, y, x + 64, y, 64);

// Bird's eye
draw_set_color(c_white);
draw_circle(x + 16, y - 8, 16, false);
draw_set_color(c_black);
draw_circle(x + 24, y - 8, 8, false);

// Bird's wings


// Reset colors
draw_set_color(c_white);