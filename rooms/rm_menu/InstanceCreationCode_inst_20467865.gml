buttons = [
	{
		title : "Play",
		// Button hitbox
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5),
							new Vector2(64, 23)),
		
		// Goto gameplay room
		action : function() { room_goto(rm_gameplay) },
	},
	
	{
		title : "Options",
		// Button hitbox
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET),
							new Vector2(64 * 2.5, 23)),
							
		// Goto settings room
		action : function() { room_goto(rm_settings); },
	},
	
	{
		title: "Exit",
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 2),
							new Vector2(64 * 1.3, 23)),
							
		// End game
		action : function() { instance_activate_layer("PopUP"); instance_deactivate_layer("Instances") }
	}
]