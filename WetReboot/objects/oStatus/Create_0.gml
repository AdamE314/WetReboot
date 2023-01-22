
draw_set_font(fnDefault);

audio_play_sound(song_wetware,2,1);

tilesizew = 96;
tilesizeh = 64;
tilespace = 8;

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

global.scrap = 0;
global.compounds = 0;

global.energymax = 3200;
global.energy = global.energymax/2;
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
	scrap: 2,
	compounds: 0,
	mouse: 0
	},
	{
	name: "Tesla Coil",
	object: pAOE,
	sprite: sTeslaCoil,
	stack: false,
	origin: [16,16],
	enabled: false,
	scrap: 1,
	compounds: 1,
	mouse: 0
	},
	{
	name: "Sniper",
	object: oSniper,
	sprite: sSniperStack,
	stack: true,
	origin: [16,16],
	enabled: false,
	scrap: 6,
	compounds: 2,
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

win = function()
{
	var _win = instance_create_depth(0,0,-1,oLose);
	_win.mystring = "You Won\nPress R to Restart."
}

makeProgress = function()
{
	switch(global.progress)
	{
		case 2:
			buildings[2].enabled = true;
			currentSpawnPointCount = instance_number(oSpawnPoint);
			instance_destroy(oFakeDoor);
			oPathfindingSetup.recreateGrid();
			break;
			
		case 4:
			buildings[3].enabled = true;
			break;
		
		case 6:
			win();
			break;
	}
}


spawning = false;
spawningDelay = 60;
spawningTimer = spawningDelay;
spawnIndex = 0;
currentSpawnPointCount = 2;
currentSpawnPoint = 0;
spawnPoints = [];
global.progress = 0;
enemySpawnLists = 
[
	[
	{enemy : oFish, count: 1},
	{enemy : oFish, count: 1},
	],
	[
	{enemy : oFish, count: 2},
	{enemy : oFish, count: 2},
	{enemy : oFish, count: 2},
	],
	[
	{enemy : oBrute, count: 1},
	{enemy : oFish, count: 2},
	{enemy : oBrute, count: 1},
	{enemy : oFish, count: 3},
	],
	[
	{enemy : oFish, count: 2},
	{enemy : oFish, count: 2},
	{enemy : oBrute, count: 1},
	{enemy : oBrute, count: 1},
	{enemy : oFish, count: 3},
	],
	[
	{enemy : oBrute, count: 1},
	{enemy : oBrute, count: 1},
	{enemy : oFish, count: 3},
	{enemy : oFish, count: 3},
	{enemy : oRunner, count: 1},
	{enemy : oRunner, count: 1},
	],
	[
	{enemy : oFish, count: 3},
	{enemy : oFish, count: 3},
	{enemy : oBrute, count: 1},
	{enemy : oBrute, count: 1},
	{enemy : oRunner, count: 1},
	{enemy : oRunner, count: 1},
	{enemy : oFish, count: 3},
	{enemy : oFish, count: 3},
	]
]