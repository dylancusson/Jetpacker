/// @description Draw speed as GUI element
draw_text(8,8, "Speed: " + string(abs(oPlayer.xSpeed)));

draw_healthbar(8, 50, 48, 58, (oPlayer.currentFuel / oPlayer.maxFuel) * 100, c_black, c_yellow, c_red, 0, false, true);