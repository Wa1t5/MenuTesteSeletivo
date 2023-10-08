/// @description Insert description here
// You can write your code in this editor

ui = new GUI(new Vector2(GUI_WIDTH / 2, GUI_HEIGHT / 2));

btn_container = new GUIContainer(new Vector2(100, 100), new Vector2(600, 96), new Vector2(0, 0));


btn_container.add_element(
	new GUIButton("Hello, World!", fnt_alagard),
	new GUISprite(spr_wow),
	new GUISprite(spr_wow),
	new GUISprite(spr_wow),
	new GUISprite(spr_wow),
	new GUISprite(spr_wow)
);

ui.add_container(btn_container);