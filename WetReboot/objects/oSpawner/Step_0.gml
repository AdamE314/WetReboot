spawnTimer--;
if(spawnTimer <= 0)
{
	instance_create_layer(x,y,"Instances",enemyType);
	spawnTimer = spawnDelay;
	spawnedCount++;
	if(spawnedCount >= enemyCount) instance_destroy();
}