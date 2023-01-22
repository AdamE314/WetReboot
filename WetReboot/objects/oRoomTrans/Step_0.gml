timer--;
if(timer == 0) room_goto(rm_level1);
if(timer < -fadeTime) instance_destroy();