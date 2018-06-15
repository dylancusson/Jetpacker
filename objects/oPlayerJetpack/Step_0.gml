/// @description Reposition and set image direction
//lerp to interpolate so it "follows" slightly behind the player
x = oPlayer.x;
y = lerp(y, oPlayer.y, .7);
image_xscale = oPlayer.image_xscale;

if (oPlayer.vertState = verticalState.jetpacking)
{
	effect_create_below(ef_smoke, x - (18 * image_xscale), y + 50, 0, c_dkgray);
}
