// When on ground, if there is no longer ground below then start falling
if (!place_meeting(x, y + 1, oBlockParent))
{
	vertState = verticalState.falling;
}

// If we press jump while on ground, we jump and transition to jumping state
if (jumpKeyPressed)
{
	ySpeed = -jumpPower;
	vertState = verticalState.jumping;
}
//Instantly recharge jetpack when touching ground
if (currentFuel <= maxFuel)
{
	currentFuel = maxFuel;
}