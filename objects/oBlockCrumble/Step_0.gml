/// @description Initiate Crumble on Collision with Player

if (place_meeting(x, y - 1, oPlayer) && !isCrumbling) 
{
	isCrumbling = true;
	alarm[0] = 1 * room_speed;
	image_speed = 1;
	
}
