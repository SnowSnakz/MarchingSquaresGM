/// @arg grid {DS_GRID} The grid to extract the lines from
/// @arg isovalue {REAL} The value to contour
/// @desc Extracts isolines from a 2d grid of values

/// Returns a ds_list of arrays (lines) with the following structure
/// array[0] = Point A >> X Position
/// array[1] = Point A >> Y Position
/// array[2] = Point B >> X Position
/// array[3] = Point B >> Y Position

var marching_squares_lookup = [
	[],
	[[0, 3, 2, -1]],
	[[-1, 4, 2, -1]],
	[[0, 3, -1, 4]],
	[[1, 0, -1, 4]],
	[[-1, 4, 2, -1], [1, 0, 0, 3]],
	[[1, 0, 2, -1]],
	[[1, 0, 0, 3]],
	[[1, 0, 0, 3]],
	[[1, 0, 2, -1]],
	[[0, 3, 2, -1], [1, 0, -1, 4]],
	[[1, 0, -1, 4]],
	[[0, 3, -1, 4]],
	[[-1, 4, 2, -1]],
	[[0, 3, 2, -1]],
	[]
];

var grid = argument0, isovalue = argument1;
var lines = ds_list_create();
	
var ww = ds_grid_width(grid) - 1, hh = ds_grid_height(grid) - 1;
for(var i = 0; i < ww; i++) 
{
	for(var j = 0; j < hh; j++) 
	{
		var cell = 0;
			
		var x1y1, x2y1, x1y2, x2y2;
		x1y1 = grid[# i,   j  ];
		x2y1 = grid[# i+1, j  ];
		x1y2 = grid[# i,   j+1];
		x2y2 = grid[# i+1, j+1];
			
		if(x1y1 > isovalue)cell |= 8;
		if(x2y1 > isovalue)cell |= 4;
		if(x2y2 > isovalue)cell |= 2;
		if(x1y2 > isovalue)cell |= 1;
			
		var lookup = marching_squares_lookup[cell];
		for(var k = 0; k < array_length_1d(lookup); k++)
		{
			var lookat = lookup[k];
			var x1, y1, x2, y2;
				
			x1 = lookat[0];
			y1 = lookat[1];
			x2 = lookat[2];
			y2 = lookat[3];
				
			x1 = i + ms_getval(x1, isovalue, x1y1, x2y1, x1y2, x2y2);
			x2 = i + ms_getval(x2, isovalue, x1y1, x2y1, x1y2, x2y2);
			y1 = j + ms_getval(y1, isovalue, x1y1, x2y1, x1y2, x2y2);
			y2 = j + ms_getval(y2, isovalue, x1y1, x2y1, x1y2, x2y2);
				
			ds_list_add(lines, [x1, y1, x2, y2]);
		}
	}
}
	
return lines;
