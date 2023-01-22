timer--;
if(timer == 0) room_goto(rmLose);
if(timer < -fadeTime) timer = -fadeTime;