// While falling, check if there is a ground directly below, if so change to onGround state
if (place_meeting(x, y + 1, oBlockParent))
{
	vertState = verticalState.onGround;
}

// Transition to jetpacking state if Jump key is held while falling and player has fuel
if (jumpKeyDown && currentFuel > 10) 
{
	vertState = verticalState.jetpacking;
}
