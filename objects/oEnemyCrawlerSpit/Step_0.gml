/// @description Destroy projectile when hitting a wall
if (collision_line(x, y, x + lengthdir_x(speed, direction),
						 y + lengthdir_y(speed, direction),
						 oBlockParent, false, true))
	{
		effect_create_above(ef_smokeup, x, y, 1, c_lime);
		instance_destroy();
	}