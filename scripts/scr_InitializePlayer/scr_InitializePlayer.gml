// This script is run from our Player's create event

// Save global keys to local memory for better access speeds
// Global keys found in scr_InitializeGameController
jumpKey  = global.jumpKey;
rightKey = global.RightKey;
leftKey  = global.LeftKey;
shootKey = global.shootKey;


//Initialize Physics Variables
maxRunSpeed  = 4.8;
maxMoveSpeed = 35;
maxFallSpeed = 12;
maxJetSpeed  = 4;

xSpeed = 0;		// Current value to apply to X coordinate of Player
ySpeed = 0;		// Current value to apply to Y coordinate of Player
frict  = .2;	// Friction to apply against our Player
accel  = .4;	// Acceleration rate of Player

weight    = .5;
jetPower  = .12;
jumpPower = 10;

vertState = verticalState.falling; //VerticalState

//Set respawn point
respawnX = x;
respawnY = y;
respawnDirection = image_xscale;

//Create Player's gun object and place it on top of the player (not behind)
instance_create_depth (x, y, depth - 1, oPlayerGun);

jetpack = instance_create_depth (x, y, depth + 1, oPlayerJetpack);

//Jetpack Variables
currentFuel = oGameController.playerMaxFuel;
maxFuel     = oGameController.playerMaxFuel;
fuelLossRate = oGameController.playerFuelLossRate;
fuelChargeRate = oGameController.playerFuelChargeRate;

//Item variables
itemCount = oGameController.playerItemCount;

