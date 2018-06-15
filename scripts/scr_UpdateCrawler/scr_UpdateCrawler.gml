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
		sprite_index = sEnemyCrawlerMoving;
		image_speed  = (xSpeed / crawlerChaseSpeed);
		
		//Check for player within range and switch to chasing state

		if (abs(oPlayer.y - y) < yRange) 
		{
			crawlerDir = (oPlayer.x > x) ? 1 : -1;
	
			if (collision_line(x, y, x + (xRange * crawlerDir), oPlayer.y, oPlayer, false, false))
			{
				state = crawlerState.chasing;
			}
		}
		
		// Detect if it is free to move
		if (!place_meeting(x + xSpeed + (32 * crawlerDir), y, oBlockParent) && !place_free(x + xSpeed, y + 1))
		{
			xSpeed = crawlerSpeed * crawlerDir;
		}
		//if not free, turn around and change speed to move in that direction
		else
		{
			crawlerDir *= -1;
			xSpeed *= -1;
		}
		break;
		
	case crawlerState.chasing:
		sprite_index = sEnemyCrawlerMoving;
		image_speed  = (xSpeed / crawlerChaseSpeed);
		
		//Check for player within attack range
		if (collision_ellipse(x - (xRange * .6), y - yRange, x + (xRange * .6), y + yRange, oPlayer, false, false))
		{
			state = crawlerState.attacking;
		}
		// Detect if it is free to move
		if (!place_meeting(x + xSpeed + (32 * crawlerDir), y, oBlockParent) && !place_free(x + xSpeed, y + 1))
		{
			xSpeed = crawlerChaseSpeed * crawlerDir;
			
		}
		//if not free, turn around and change speed to move in that direction
		else
		{
			crawlerDir *= -1;
			xSpeed *= -1;
		}
		break;
		
	case crawlerState.attacking:
		xSpeed = 0;
		//If we are able to shoot (not cooling down)
		if (!justShot)
		{
			sprite_index = sEnemyCrawlerSpitting;
			image_speed = 1;
			//Create bullet
			with instance_create_layer(x, y, global.mainLayer, oEnemyCrawlerSpit) 
			{
				direction = (oEnemyCrawler.image_xscale == 1) ? 0 : 180;
				speed = 8; //should make this bullets speed for upgrading ammo?
				image_xscale = oEnemyCrawler.image_xscale;
			}
			justShot = true;
			alarm_set(0, 120); //2 second alarm for cooldown
		}
		//When animation ends, set state back to moving
		else if (image_index > (image_number -1))
		{
			state = crawlerState.moving;
		}
		
		break;
	
}
//-------------------------------------------------------------------------------------------------------------------





image_xscale = crawlerDir;
x += xSpeed;
