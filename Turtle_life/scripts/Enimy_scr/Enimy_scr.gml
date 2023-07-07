// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_choose(){
	next_state = choose(scr_enimy_walk, scr_stopped_enimy);
	
	if next_state == scr_enimy_walk{
		state = scr_enimy_walk;
		dest_x = random_range(0, room_width);
		dest_y = random_range(0, room_height);
	}else if next_state == scr_stopped_enimy{
		state = scr_stopped_enimy;
	}
}

function scr_enimy_walk(){
	image_speed = 1;
	
	var _dir = point_direction(x, y, dest_x, dest_y);
	hveloc = lengthdir_x(veloc, _dir);
	vveloc = lengthdir_y(veloc, _dir);
	
	x += hveloc;
	y += vveloc;
}

function scr_stopped_enimy(){
	image_speed = 0.3;
}