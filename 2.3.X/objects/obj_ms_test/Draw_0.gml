if(!surface_exists(surf))
{
	draw_set_color(c_white);
	render_surf();
}
draw_surface(surf, 0, 0);