// Self disable
instance_deactivate_layer("PopUP");

buttons = [
	{
		title : "Yes",
		// Button hitbox
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5),
							new Vector2(64, 23)),
		
		// Goto gameplay room
		action : function() { game_end(); },
	},
	
	{
		title : "No",
		// Button hitbox
		col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET),
							new Vector2(64 * 2.5, 23)),
							
		// Goto settings room
		action : function() { instance_deactivate_layer("PopUP"); instance_activate_layer("Instances"); },
	},
]