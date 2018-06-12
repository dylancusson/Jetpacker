/// @description Match to player after their step event ends

x = lerp(x, oPlayer.x, max(min(abs(oPlayer.xSpeed), 1),.8));
y = lerp (y, oPlayer.y, .6);

//Match direction to player's
image_xscale = oPlayer.image_xscale;

/// @description Check for gun firing

scr_PlayerGunShoot();