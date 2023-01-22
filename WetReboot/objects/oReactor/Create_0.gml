progress = function()
{
	if(sprite_index == sReactorOff) sprite_index = sReactorFlicker;
	else if(sprite_index == sReactorFlicker) sprite_index = sReactorOn;
}