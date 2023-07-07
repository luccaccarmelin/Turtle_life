/// @description Change states

//Basic move
script_execute(state);

if alarm[1] <= 0{
	stamina += 1;
}

stamina = clamp(stamina, 0, max_stamina);