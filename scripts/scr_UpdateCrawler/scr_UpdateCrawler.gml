switch (state) {
	case crawlerState.idle:
		sprite_index = sEnemyCrawlerIdle;
		break;
	
	case crawlerState.inAir:
		if (ySpeed < maxFallSpeed) 
		{
			ySpeed += weight;
		}
		break;
		
	case crawlerState.moving:
		// Detect if it is free to move
		if (!place_meeting(x + xSpeed + (32 * crawlerDir), y, oBlockParent) && !place_free(x + xSpeed, y + 1))
		{
			xSpeed = crawlerSpeed * crawlerDir;
		}
		else
		{
			crawlerDir *= -1;
			xSpeed *= -1;
		}
		break;
		
	case crawlerState.chasing:
		
		// Detect if it is free to move
		if (!place_meeting(x + xSpeed + (32 * crawlerDir), y, oBlockParent) && !place_free(x + xSpeed, y + 1))
		{
			xSpeed = crawlerChaseSpeed * crawlerDir;
			
		}
		else
		{
			crawlerDir *= -1;
			xSpeed *= -1;
		}
		break;
		
	case crawlerState.attacking:
		xSpeed = 0;
		sprite_index = sEnemyCrawlerGrabbing;
		
		if (image_speed > 0)
		{
			if (image_index == 4) 
			{
				show_debug_message("Shot");
			}
			else if (image_index > image_number - 1)
			{
				state = crawlerState.moving;
			}
		}
		break;
	
	
	
}
//-------------------------------------------------------------------------------------------------------------------
//Check for player within range and switch to chasing state

if (abs(oPlayer.y - y) < yRange) 
{
	if (collision_line(x, y, x + (xRange * crawlerDir), oPlayer.y, oPlayer, false, false))
	{
		state = crawlerState.chasing;
	}
}

else 
{
	state = crawlerState.moving;
}




image_xscale = crawlerDir;
x += xSpeed;
