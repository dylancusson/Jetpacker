/// @description Bullet Collision

if (collision_line(x, y, x + lengthdir_x(speed, direction),
						 y + lengthdir_y(speed, direction),
						 oBlockParent, false, true))
	{
		instance_destroy();
	}
	