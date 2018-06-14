// Saving keyboard checks to variables for easy access later
// and easier to change later
jumpKeyDown		= keyboard_check(jumpKey);
jumpKeyPressed	= keyboard_check_pressed(jumpKey);
rightKeyDown	= keyboard_check(rightKey);
leftKeyDown		= keyboard_check(leftKey);
shootKeyPressed = keyboard_check_pressed(shootKey);
shootKeyDown	= keyboard_check(shootKey);

//Flip image based on direction we're moving
/***
if (xSpeed > 0) 
{
	image_xscale = 1;
}
else if (xSpeed < 0)
{
		image_xscale = -1;
}

Depreciated in favor of having the direction you press control where you face
Needed for the shogtun dash to work properly.
***/ 
//--------------------------------------------------------------------------------------------------------
// Horizontal Input and Motion Handling with Collision Checks

//Update direction based on keys pressed

if (rightKeyDown) 
{
	image_xscale = 1;
}

else if (leftKeyDown)  
{
	image_xscale = -1;
}

//When the right key is down, increase xSpeed by acceleration
if (rightKeyDown && !place_meeting(x + 1, y, oBlockParent)) 
{
	//As long as xSpeed hasnt reached max, increase by acceleration
	if (xSpeed < maxRunSpeed) {
			xSpeed += accel;
	}
}

//When the left key is down, increase xSpeed by acceleration but negatively so we go left
else if (leftKeyDown && !place_meeting(x - 1, y, oBlockParent))
{
	//-maxRunSpeed so the value is flipped for left movement on the x-axis
	if (xSpeed > -maxRunSpeed)
	{
		xSpeed -= accel;
	}
	
}


//Apply friction when not moving left or right
if (!rightKeyDown && !leftKeyDown) 
{
	if (xSpeed != 0) 
	{
		//Use sign(xSpeed) to control direction. When moving left the sign is negative
		xSpeed -= sign(xSpeed) * frict;
	}
}

//When not colliding with a wall xSpeed away, move X by xSpeed
if (!place_meeting(x + xSpeed, y, oBlockParent))
{
	x += xSpeed;
}
	//If there is a wall xSpeed away, while youre not touching it, move right up to it and then stop
	else 
	{
		while (!place_meeting(x + sign(xSpeed), y, oBlockParent))
		{
			x += sign(xSpeed);
		}
		xSpeed = 0;
	}

// State Machine for Players Vertical Movement

switch (vertState)
{
	case verticalState.onGround:
		scr_PlayerStateOnGround();
		break;
	case verticalState.jumping:
		scr_PlayerStateJumping();
		break;
	case verticalState.jetpacking:
		scr_PlayerStateJetpacking();
		break;
	case verticalState.falling:
		scr_PlayerStateFalling();
		break;
		
}
//--------------------------------------------------------------------------------------------------------

// Vertical Input and Motion Handling with Collision Checks

//While in the air, apply our weight to bring us down
if (vertState != verticalState.onGround)
{
	if (ySpeed < maxFallSpeed)
	{
		ySpeed += weight;
	}
}

if (!place_meeting(x, y + ySpeed, oBlockParent))
{
	y += ySpeed;
}
else
{
	move_contact_solid(point_direction(x, y, x, y + ySpeed), maxFallSpeed);
	ySpeed = 0;
}

