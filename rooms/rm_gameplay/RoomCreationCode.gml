// Spawn player
instance_create_layer(	room_width / 2, 
						room_height / 2,
						"Player",
						obj_player);
						
// Spawn obj game
instance_create_layer(0, 0, "GameObjects", obj_game);