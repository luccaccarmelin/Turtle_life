// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_Player_Walk(){
	
	//Move
	right = keyboard_check(ord("D"));
	up = keyboard_check(ord("W"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S"));

	hveloc = (right - left) * veloc;

	if place_meeting(x + hveloc, y, Obj_Wall){
			while !place_meeting(x + sign(hveloc), y, Obj_Wall){
				x += sign(hveloc);
			}
		
			hveloc = 0;
	}

	x += hveloc;

	vveloc = (down - up) * veloc;

	if place_meeting(x, y + vveloc, Obj_Wall){
			while !place_meeting(x, y + sign(vveloc), Obj_Wall){
				y += sign(vveloc);
			}
		
			vveloc = 0;
	}

	y += vveloc;
	
	if mouse_check_button_pressed(mb_right){
		alarm[0] = 8;
		dash_dir = point_direction(x, y, mouse_x, mouse_y);
		state = Scr_Player_Dash;
	}
}

function Scr_Player_Dash(){
	hveloc = lengthdir_x(dash_veloc, dash_dir);
	vveloc = lengthdir_y(dash_veloc, dash_dir);
	
	x += hveloc
	y += vveloc
}