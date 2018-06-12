// Input Controls - Allow us to change input controls as needed
global.jumpKey = ord("X");
global.RightKey = vk_right;
global.LeftKey = vk_left;
global.shootKey = ord("Z");
global.menuKey = ord("M");

global.mainLayer = "Instances";

enum verticalState
{
	onGround,
	jumping,
	jetpacking,
	falling
}

//Create new random seed
randomize();

//Create camera
instance_create_layer(0, 0, global.mainLayer, oCamera);

//Player Stats
playerGunFireRate    = 50;
playerMaxFuel		 = 50;
playerFuelLossRate   = .5;
playerFuelChargeRate = 25;