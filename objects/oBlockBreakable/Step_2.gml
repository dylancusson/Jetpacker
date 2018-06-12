/// @description Check for collision with bullet after all other steps run

if (place_meeting(x,y, oPlayerGunBullet))
{
	alarm_set(0, 5);
}

