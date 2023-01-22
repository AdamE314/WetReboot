
if(room == rmLose)
{
	align();
	draw_text_color(room_width/2,room_height/2,"Game Over\nPress R to Restart.",c_white,c_white,c_white,c_white,1);
	align_reset();
}

draw_set_alpha((60-abs(timer))/fadeTime);
draw_rectangle_color(-room_width,-room_height,room_width*2,room_height*2,c_black,c_black,c_black,c_black,0);