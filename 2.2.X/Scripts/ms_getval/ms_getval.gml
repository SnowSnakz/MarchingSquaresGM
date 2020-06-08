/// @arg idx
/// @arg isovalue
/// @arg x1y1 
/// @arg x2y1 
/// @arg x1y2 
/// @arg x2y2
/// @desc Returns an x or y position from a lookup table value

var idx = argument0, isovalue = argument1, x1y1 = argument2, x2y1 = argument3, x1y2 = argument4, x2y2 = argument5;

if(sign(idx) == -1)return abs(idx);
switch(idx) 
{
	default:
		return 0;
	case 1: // top
		return ms_offset(x1y1, x2y1, isovalue);
	case 2: // bottom
		return ms_offset(x1y2, x2y2, isovalue);
	case 3: // left
		return ms_offset(x1y1, x1y2, isovalue);
	case 4: // right
		return ms_offset(x2y1, x2y2, isovalue);
}
