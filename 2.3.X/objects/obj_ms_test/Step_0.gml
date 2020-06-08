if(mouse_check_button(mb_left) || mouse_check_button(mb_right)) 
{
	for(var i = 0; i < gw; i++)
	{
		for(var j = 0; j < gh; j++)
		{
			var new_val = grid[# i, j];
			
			new_val += clamp(1 - (point_distance(i, j, mouse_x / cs, mouse_y / cs) / 2), 0, 1) * 0.1 * (mouse_check_button(mb_left) -  mouse_check_button(mb_right));
			new_val = clamp(new_val, 0, 1);
			
			grid[# i, j] = new_val;
		}
	}
	ds_list_destroy(lines);
	lines = marching_squares(grid, 0.5);
	surface_free(surf);
}