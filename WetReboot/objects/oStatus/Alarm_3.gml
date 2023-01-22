/// @description Return to awakeness
oCamera.zoomOut = false;
energyrefill = global.energymax/60;
global.health += 5; if(global.health > global.healthmax) global.health = global.healthmax;
alarm_set(4,60);