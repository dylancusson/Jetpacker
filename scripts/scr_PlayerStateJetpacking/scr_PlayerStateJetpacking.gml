//Apply our jetpack force when our ySpeed is not max and there isnt a block above us
if (ySpeed > -maxJetSpeed && !place_meeting(x, y - 1, oBlockParent))
{
	ySpeed -= jetPower + weight + max(0, abs(ySpeed) / 20);
}

//Transition to falling state when jumKey is released
if (keyboard_check_released(jumpKey) || currentFuel <= 0)
{
	vertState = verticalState.falling;
}

//As long as we are in jetpack state, decrease fuel.
if (currentFuel > 0)
{
	currentFuel -= fuelLossRate;
}
