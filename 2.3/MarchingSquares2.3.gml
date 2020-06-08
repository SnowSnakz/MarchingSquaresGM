global.__marching_squares_lookup = [
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

function __ms_offset(x1, x2, isovalue)
{
	return 0.5 + (isovalue - (x1 + x2) / 2);
}

function __ms_getval(idx, isovalue, x1y1, x2y1, x1y2, x2y2)
{
	if(sign(idx) == -1)return abs(idx);
	switch(idx) 
	{
		default:
			return 0;
		case 1: // top
			return __ms_offset(x1y1, x2y1, isovalue);
		case 2: // bottom
			return __ms_offset(x1y2, x2y2, isovalue);
		case 3: // left
			return __ms_offset(x1y1, x1y2, isovalue);
		case 4: // right
			return __ms_offset(x2y1, x2y2, isovalue);
	}
}

function marching_squares(grid, isovalue) 
{
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
			
			var lookup = global.__marching_squares_lookup[cell];
			for(var k = 0; k < array_length(lookup); k++)
			{
				var x1, y1, x2, y2;
				
				x1 = lookup[k][0];
				y1 = lookup[k][1];
				x2 = lookup[k][2];
				y2 = lookup[k][3];
				
				x1 = i + __ms_getval(x1, isovalue, x1y1, x2y1, x1y2, x2y2);
				x2 = i + __ms_getval(x2, isovalue, x1y1, x2y1, x1y2, x2y2);
				y1 = j + __ms_getval(y1, isovalue, x1y1, x2y1, x1y2, x2y2);
				y2 = j + __ms_getval(y2, isovalue, x1y1, x2y1, x1y2, x2y2);
				
				ds_list_add(lines, [x1, y1, x2, y2]);
			}
		}
	}
	
	return lines;
}
