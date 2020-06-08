randomize();

grid = ds_grid_create(16, 16);

gw = ds_grid_width(grid);
gh = ds_grid_height(grid);

cs = 16;

for(var i = 0; i < gw; i++)
{
	for(var j = 0; j < gh; j++)
	{
		grid[# i, j] = 0;
	}
}
lines = marching_squares(grid, 0.5);

surf = noone;

render_surf = function() {
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