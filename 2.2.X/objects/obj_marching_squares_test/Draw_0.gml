if(!surface_exists(surf))
{
	surf = surface_create(gw*cs, gh*cs);
	surface_set_target(surf);
	draw_set_color(c_fuchsia);
	for(var i = 0; i < ds_list_size(lines); i++) 
	{
		var line = lines[|i];
		draw_line(line[0]*cs, line[1]*cs, line[2]*cs, line[3]*cs);
	}
	surface_reset_target();
}
draw_surface(surf, 0, 0);