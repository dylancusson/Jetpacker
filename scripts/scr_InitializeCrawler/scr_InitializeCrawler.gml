// Initialize Crawler Variables

crawlerSpeed      = 1.4; //Normal move speed of the Crawler
xSpeed			  = 0; //Initial xSpeed = default speed
crawlerChaseSpeed = 4.8; //Speed when chasing player
crawlerDamage	  = 10; //Damage done to player upon being hit
crawlerDir		  = 1; //Starting Direction (right)
maxFallSpeed      = 12;
weight			  = 2;
xRange			  = 1280; //How far to check ahead for Player
yRange			  = 192; //Used for width of the line checking for the player
enum crawlerState {
	idle,
	inAir,
	moving,
	chasing,
	attacking
}

state = crawlerState.moving;