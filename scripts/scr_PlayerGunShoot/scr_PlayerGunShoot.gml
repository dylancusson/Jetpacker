//If fire rate is ready
if (--shotTimer <= 0) 
{
	if (keyboard_check_pressed(global.shootKey))
		{
			//Create bullets
			shotTimer = fireRate;
			
			//Move gun back recoil amount
			x -= image_xscale * recoilAmt;
			
			// New way to do it with splay angle and ammount of bullets fired in single shot			
			//Loop through how many bullets are shot
			for (var i = 0; i < splayAmmount; i += 1)
			{
			
			//Variables to calculate changing angle for each bullet and change angles accordingly
			var positiveAngle = ((splayRange / 2) - ((splayRange / (splayAmmount - 1)) * i)) % 360;
			var negativeAngle = ((splayRange / (splayAmmount - 1) * i) + (180 - (splayRange / 2))) % 360;
			
			//Create and give force to bullet
				with instance_create_layer(x, y + 32, global.mainLayer, oPlayerGunBullet) {
				direction = (oPlayer.image_xscale == 1) ? positiveAngle : negativeAngle;
				speed = 25; //should make this bullets speed for upgrading ammo?
				image_xscale = oPlayer.image_xscale;
				}
				
			}
			
			audio_play_sound(sfx_shotgun, 10, false);
			
			//Apply force to the player from shooting in the opposite direction you're facing
			if (abs(oPlayer.xSpeed <= oPlayer.maxMoveSpeed)) 
			{
			oPlayer.xSpeed -= 16 * oPlayer.image_xscale;
			}
		}
}