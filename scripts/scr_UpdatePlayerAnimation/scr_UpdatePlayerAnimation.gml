//Switch to control animations

switch (vertState)
{
	case verticalState.onGround:
		{
			if (xSpeed == 0)
			{
				sprite_index = sPlayerIdle;
			}
			
			else 
			{
				sprite_index = sPlayerRun;
				image_speed = (xSpeed / maxRunSpeed);
			}
			
			break;
		}
	
	case verticalState.falling:
		{
			if (ySpeed > 3) 
			{
				sprite_index = sPlayerInAir;
				image_index = 1;
			}
			image_speed = 0;
			jetpack.sprite_index = sPlayerJetpackOff;
			break;
		}
		
	case verticalState.jumping:
		{
			sprite_index = sPlayerInAir;
			image_index = 0;
			image_speed = 0;
			break;
		}
	
	case verticalState.jetpacking:
		{
			sprite_index = sPlayerInAir;
			image_index = 0;
			image_speed = 0;
			jetpack.sprite_index = sPlayerJetpackOn;
			break;
		}
}