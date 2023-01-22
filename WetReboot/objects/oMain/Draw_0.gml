

draw_sprite_ext(sFish,image_index,room_width*1/5,room_height/2,2,2,0,c_white,1);
draw_sprite_ext(sBrute,image_index,room_width/2,room_height/2,2,2,0,c_white,1);
draw_sprite_ext(sRunner,image_index,room_width*4/5,room_height/2,2,2,0,c_white,1);

align();
draw_text_outline(room_width/2,room_height*1/4,"FUNNY FISH ON THE NAUTILUS");
draw_text_outline(room_width/2,room_height*2/3,"PRESS ANY KEY TO START");
align_reset();