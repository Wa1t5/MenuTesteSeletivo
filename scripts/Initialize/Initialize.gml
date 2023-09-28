#region Gui info
	#macro OFFSET 64
	#macro GUI_WIDTH display_get_gui_width()
	#macro GUI_HEIGHT display_get_gui_height()
#endregion

#region Game options
	global.volume = 0;
	global.score = 0;
	global.def_speed = 1;
	global.speed = global.def_speed;
#endregion

#region Game Menus
	global.game_over_popup = {
		title: "Game Over!",
		buttons : [
			{
				title : "Tentar denovo",
				
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 0),
									new Vector2(64 * 4.3, 25)),
		
				// Action
				action : function() { 
					global.score = 0;
					room_restart();
				},
			},
			
			{
				title: "Voltar ao menu",
				
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 1),
									new Vector2(64 * 4.3, 25)),
				
				// Action
				action : function() { 
					global.speed = global.def_speed; 
					global.score = 0; 
					room_goto(rm_menu); 
				},
			},
		]
	}
	
	global.pause_game_popup = {
		title: "Jogo Pausado!",
		buttons : [
			{
				title : "Continuar",
				
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 0),
									new Vector2(64 * 3, 25)),
		
				// Action
				action : function() { 
					global.speed = global.def_speed;
					instance_destroy(obj_popup);
				},
			},
			
			{
				title: "Voltar ao menu",
				
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 1),
									new Vector2(64 * 5, 25)),
				
				// Action
				action : function() { 
					global.speed = global.def_speed; 
					room_goto(rm_menu); 
				},
			},
		]
	}
	
	global.exit_game_popup = {
		title : "Voce deseja sair?",
		buttons : [
			{
				title : "Sim",
							
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 0),
									new Vector2(64, 25)),
		
				// Goto gameplay room
				action : function() { game_end(); },
			},
	
			{
				title : "Nao",
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 1),
									new Vector2(64 * 2.5, 25)),
							
				// Destroy popups
				action : function() { instance_destroy(obj_popup); },
			}
		]
	}

	global.main_menu = {
		title : "Flappy",
		buttons : 
		[
			{
				title : "Jogar",
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 0),
									new Vector2(64 * 1.5, 25)),
		
				// Goto gameplay room
				action : function() { room_goto(rm_gameplay) },
			},
	
			{
				title : "Opcoes",
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 1),
									new Vector2(64 * 2.5, 25)),
							
				// Goto settings room
				action : function() { room_goto(rm_settings); },
			},
	
			{
				title: "Sair",
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 2),
									new Vector2(64 * 1.3, 25)),
							
				// Create popup
				action : function() { 
					instance_create_layer(0, 0, "PopUP", obj_popup, global.exit_game_popup);
				}
			}
		]
	}
	
	global.settings_menu = {
		title : "Opcoes",
		buttons : 
		[	
			{
				title : $"Volume: [{(string_repeat("=", global.volume))}" + $"{(string_repeat("-", 10 - global.volume))}]",
		
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 0),
									new Vector2(64 * 6.3, 25)),
		
				// Update and redraw slider
				slide : function(_slide) {	
					// Move slider with keyboard
					global.volume += (_slide < 2) ? _slide : 0; 
			
					// Mouse position and collision detection
					var _offset = new Vector2(180, 0);
					var _mouse_pos = new Vector2(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
					var _col = self.col.detect_collision(_mouse_pos);
									
					// Move slider with mouse
					if (_slide == 2 && _col) {
						var _relative_mouse_pos = round(floor(self.col.relative_collider_position(_mouse_pos, _offset).x) / 21);
						global.volume = (_relative_mouse_pos >= 0) ? _relative_mouse_pos : global.volume;
				
						// Cleanup
						delete _offset;
						delete _mouse_pos;
						delete _col;
					}
									
					// Limit maximum volume
					global.volume = clamp(global.volume, 0, 10);
									
					// I separated it in 2 steps because I can't use two commands inside one {} operator
					self.title = $"Volume: [{(string_repeat("=", global.volume))}" 
					self.title += $"{(string_repeat("-", 10 - global.volume))}]";
				},
			},
	
			{
				title : "Tela Cheia: OFF",
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 1),
									new Vector2(64 * 5, 25)),
							
				// Set window to fullscreen	
				action : function() {	window_set_fullscreen(!window_get_fullscreen()); 
										self.title = $"Tela Cheia: {( (window_get_fullscreen()) ? "ON" : "OFF" )}"; 
									},
			},
	
			{
				title: "Voltar",
				// Button hitbox
				col : new Clickable(new Vector2(GUI_WIDTH * .5, GUI_HEIGHT * .5 + OFFSET * 2),
									new Vector2(64 * 2.0, 25)),
							
				// Return to main menu
				action : function() { room_goto(rm_menu); }
			}
		]
	}
#endregion