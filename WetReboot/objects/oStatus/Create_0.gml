
audio_play_sound(song_wetware,2,1);

enum STATE
{
	FREE,
	SLEEP
}

global.state = STATE.FREE;
global.enterFree = false;
rebooting = false;
enterSleep = function()
{
	for(var i=0;i<array_length(buildings);i++) { buildings[i].mouse = 0; }
	buildMode = -1;
	global.state = STATE.SLEEP;
	oPlayer.wakeup = false;
	global.enterFree = false;
	audio_play_sound(sndPowerDown,1,0);
	alarm_set(0,120);
}
enterFree = function()
{
	global.state = STATE.FREE;
	rebooting = true;
	alarm_set(3,90);
}

global.scrap = 20;
global.compounds = 20;

global.energymax = 600;
global.energy = global.energymax;
energyrefill = 0;

global.healthmax = 25;
global.health = global.healthmax;

buildMode = -1; // -1 for none, index of which one for building
buildAngle = 0;
buildTurnSpeed = 0.5;

buildings = 
[
	{
	name: "Turret",
	object: pTurret,
	sprite: sTurretStack,
	stack: true,
	origin: [16,16],
	enabled: true,
	scrap: 3,
	compounds: 0,
	mouse: 0 // 0 for none, 1 for moused over, 2 for click
	},
	{
	name: "Mine",
	object: pMine,
	sprite: sMineStack,
	stack: true,
	origin: [16,16],
	enabled: true,
	scrap: 1,
	compounds: 0,
	mouse: 0
	},
	{
	name: "Tesla Coil",
	object: pAOE,
	sprite: sTurretHitbox,
	stack: false,
	origin: [16,16],
	enabled: true,
	scrap: 0,
	compounds: 0,
	mouse: 0
	},
	{
	name: "Sniper Turret",
	object: oSniper,
	sprite: sSniperStack,
	stack: true,
	origin: [16,16],
	enabled: true,
	scrap: 0,
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
	audio_play_sound(sJobDone,1,0);
	instance_create_layer(_x,_y,"Instances",buildings[buildMode].object);
	global.scrap -= buildings[buildMode].scrap;
	global.compounds -= buildings[buildMode].compounds;
	buildMode = -1;
}


spawning = false;
spawningDelay = 60;
spawningTimer = spawningDelay;
spawnIndex = 0;
currentSpawnPointCount = 2;
currentSpawnPoint = 0;
spawnPoints = [ {spawnX: room_width/2, spawnY: room_height/2}, {spawnX: room_width*3/4, spawnY: room_height/4} ]
global.progress = 0;
enemySpawnLists = 
[
	[
	{enemy : oFish, count: 1},
	{enemy : oFish, count: 2},
	{enemy : oFish, count: 3},
	{enemy : oBrute, count: 1}
	]
]