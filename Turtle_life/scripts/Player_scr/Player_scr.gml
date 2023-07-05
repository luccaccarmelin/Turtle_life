// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_walk(){

	//Basic move
	Right = keyboard_check(ord("D"));
	Up = keyboard_check(ord("W"));
	Left = keyboard_check(ord("A"));
	Down = keyboard_check(ord("S"));

	hveloc = (Right - Left) * veloc;

	if place_meeting(x + hveloc, y, Obj_Wall){
			while !place_meeting(x + sign(hveloc), y, Obj_Wall){
				x +=   sign(hveloc);
			}
		
			hveloc = 0;
	}

	x += hveloc;

	vveloc = (Down - Up) * veloc;

	if place_meeting(x, y + vveloc, Obj_Wall){
		while !place_meeting(x, y + sign(vveloc), Obj_Wall){
			y += sign(vveloc);
		}
	
		vveloc = 0;
	}

	y+= vveloc

	//Advanced move

	dir = floor((point_direction(x, y, mouse_x, mouse_y) + 45)/90);

	if hveloc == 0 and vveloc == 0{
		switch dir{
			default:
				sprite_index = Spr_Player_Idle_Right;
			break;
			case 1:
				sprite_index = Spr_Player_Idle_Up;
			break;
			case 2:
				sprite_index = Spr_Player_Idle_Left;
			break;
			case 3:
				sprite_index = Spr_Player_Idle_Down;
			break;
		}
	}else{
		switch dir{
			default:
				sprite_index = Spr_Player_Run_Right;
			break;
			case 1:
				sprite_index = Spr_Player_Run_Up;
			break;
			case 2:
				sprite_index = Spr_Player_Run_Left;
			break;
			case 3:
				sprite_index = Spr_Player_Run_Down;
			break;
		}
	}
	
	if keyboard_check_pressed(ord("E")){
		alarm[0] = 30;
		dash_dir = point_direction(x, y, mouse_x, mouse_y);
		state = scr_player_dash;
	}
}

function scr_player_dash(){
		hveloc = lengthdir_x(dash_veloc, dash_dir);
		vveloc = lengthdir_y(dash_veloc, dash_dir);
		
		x += hveloc;
		y += vveloc;
		
		var _inst = instance_create_layer(x, y, "Instances", Obj_dash)
		_inst.sprite_index = sprite_index;
}