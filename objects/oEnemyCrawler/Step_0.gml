/// @description Player in range check
/***
if (state == enemyState.wondering) {
	sprite_index = sEnemyCrawlerMoving;
	
	if (collision_circle(x, y, 80, oPlayer, false, false)) {
		state = enemyState.attacking;
	} 
}

if (state == enemyState.attacking) {
	
	sprite_index = sEnemyCrawlerGrabbing;
	
	//Attack animation ends
	if (image_index > image_number - 1) {
		state = enemyState.wondering;
	}
}
***/

scr_UpdateCrawler();