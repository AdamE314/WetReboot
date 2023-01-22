
// Round up to the next power of two
function round_pow2(_val)
{
	_val |= _val >> 1;
	_val |= _val >> 2;
	_val |= _val >> 4;
	_val |= _val >> 8;
	_val |= _val >> 16;
	return _val+1;
}