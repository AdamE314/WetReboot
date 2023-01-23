audio_play_sound(snEnemykilled,1,0);

var _anim = instance_create_layer(x,y,"Instances",oAnimation);
_anim.sprite_index = sEnemyDeath;

path_delete(path);