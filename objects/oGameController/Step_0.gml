/// @description Debug Keys for Testing Only

if (keyboard_check_pressed(vk_pageup)) 
{
	if(room_next(room) != -1)
	{
		room_goto_next();
	}
}

if (keyboard_check_pressed(vk_pagedown)) 
{
	if(room_previous(room) != -1)
	{
		room_goto_previous();
	}
}