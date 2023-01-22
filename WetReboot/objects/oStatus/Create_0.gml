
enum STATE
{
	FREE,
	SLEEP
}

global.state = STATE.FREE;

enterSleep = function()
{
	for(var i=0;i<array_length(buildings);i++) { buildings[i].mouse = 0; }
	instance_create_layer(room_width/2,room_height/2,"Instances",pEnemy);
	buildMode = -1;
	global.state = STATE.SLEEP;
}
enterFree = function()
{
	global.state = STATE.FREE;
	global.energy = global.energymax;
}

global.scrap = 0;
global.compounds = 0;

global.energymax = 300;
global.energy = global.energymax;

buildMode = -1; // -1 for none, index of which one for building

buildings = 
[
	{
	name: "Turret",
	object: pTurret,
	sprite: sTurretHitbox,
	origin: [16,16],
	enabled: true,
	scrap: 3,
	compounds: 0,
	mouse: 0 // 0 for none, 1 for moused over, 2 for click
	},
	{
	name: "Mine",
	object: pTurret,
	sprite: sTurretHitbox,
	origin: [16,16],
	enabled: true,
	scrap: 1,
	compounds: 0,
	mouse: 0
	},
	{
	name: "Tesla Coil",
	object: pTurret,
	sprite: sTurretHitbox,
	origin: [16,16],
	enabled: false,
	scrap: 1,
	compounds: 1,
	mouse: 0
	},
	{
	name: "Sniper Turret",
	object: pTurret,
	sprite: sTurretHitbox,
	origin: [16,16],
	enabled: false,
	scrap: 6,
	compounds: 0,
	mouse: 0
	},
]

buildCheckTile = function(_x,_y,_hitbox=sTurretHitbox)
{
	mask_index = _hitbox;
	var _blocked = (place_meeting(_x,_y,pWall) || place_meeting(_x,_y,pEntity));
	if(_blocked)
		return false;
	return true;
}

build = function(_x, _y)
{
	instance_create_layer(_x,_y,"Instances",buildings[buildMode].object);
	global.scrap -= buildings[buildMode].scrap;
	global.compounds -= buildings[buildMode].compounds;
	buildMode = -1;
}
