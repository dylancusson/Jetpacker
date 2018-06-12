/// @description Reposition and set image direction
//lerp to interpolate so it "follows" slightly behind the player
x = oPlayer.x;
y = lerp(y, oPlayer.y, .7);
image_xscale = oPlayer.image_xscale;
