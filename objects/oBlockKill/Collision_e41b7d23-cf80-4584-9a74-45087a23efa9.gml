/// @description Check for Collision with Player

//Reset player to Respawn Point
oPlayer.xSpeed = 0;
oPlayer.ySpeed = 0;
oPlayer.image_xscale = oPlayer.respawnDirection;
oPlayer.x = oPlayer.respawnX;
oPlayer.y = oPlayer.respawnY;
oPlayerGun.x = oPlayer.respawnX;
oPlayerGun.y = oPlayer.respawnY;
oPlayerJetpack.x = oPlayer.respawnX;
oPlayerJetpack.y = oPlayer.respawnY;