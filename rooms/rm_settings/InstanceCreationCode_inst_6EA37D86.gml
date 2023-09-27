
buttons = [	
	{
		title : $"Volume: [{(string_repeat("=", global.volume))}" + $"{(string_repeat("-", 10 - global.volume))}]",
		// Button hitbox
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5),
							new Vector2(64 * 2.5, 23)),
		
		// Update and redraw slider
		slide : function(_slide) {	global.volume += _slide; 
									global.volume = clamp(global.volume, 0, 10);
									// I separated it in 2 steps because I can't use two commands inside one {} operator
									self.title = $"Volume: [{(string_repeat("=", global.volume))}" 
									self.title += $"{(string_repeat("-", 10 - global.volume))}]";
								},
	},
	
	{
		title : "Full Screen: OFF",
		// Button hitbox
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET),
							new Vector2(64 * 5, 23)),
							
		// Set window to fullscreen	
		action : function() {	window_set_fullscreen(!window_get_fullscreen()); 
								self.title = $"Full Screen: {( (window_get_fullscreen()) ? "ON" : "OFF" )}"; 
							},
	},
	
	{
		title: "Return",
		// Button hitbox
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 2),
							new Vector2(64 * 1.3, 23)),
							
		// Return to main menu
		action : function() { room_goto(rm_menu); }
	}
]