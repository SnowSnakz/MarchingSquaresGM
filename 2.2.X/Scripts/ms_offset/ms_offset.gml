/// @arg x1
/// @arg x2
/// @arg isovalue
/// @desc Finds the offset of the isovalue between x1 and x2

var x1 = argument0, x2 = argument1, isovalue = argument2;
return 0.5 + (isovalue - (x1 + x2) / 2);
