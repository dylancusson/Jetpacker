//If fire rate is ready
if (--shotTimer <= 0) 
{
	if (keyboard_check_pressed(global.shootKey))
		{
			//Create bullets
			shotTimer = fireRate;
			
			//Move gun back recoil amount
			x -= image_xscale * recoilAmt;
			
			//Straight Bullet
			instBullet1 = instance_create_layer(x, y + 32, global.mainLayer, oPlayerGunBullet);
			instBullet1.direction = (oPlayer.image_xscale == 1) ? 0 : 180;
			instBullet1.speed = 25;
			instBullet1.image_xscale = oPlayer.image_xscale;
			
			//Up Angled Bullet
			instBullet2 = instance_create_layer(x, y + 32, global.mainLayer, oPlayerGunBullet);
			instBullet2.direction = (oPlayer.image_xscale == 1) ? 5 : 175;
			instBullet2.speed = 25;
			instBullet2.image_xscale = oPlayer.image_xscale;
			
			//Down Angled Bullet
			instBullet3 = instance_create_layer(x, y + 32, global.mainLayer, oPlayerGunBullet);
			instBullet3.direction = (oPlayer.image_xscale == 1) ? 355 : 185;
			instBullet3.speed = 25;
			instBullet3.image_xscale = oPlayer.image_xscale;
			
			audio_play_sound(sfx_shotgun, 10, false);
			
			//Apply force to the player from shooting in the opposite direction you're facing
			
			oPlayer.xSpeed -= 16 * oPlayer.image_xscale;
		}
}