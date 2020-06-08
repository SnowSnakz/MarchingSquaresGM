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