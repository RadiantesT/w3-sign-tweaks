@addField(CR4Player)
private var st_settings : ST_Settings;

@addMethod(CR4Player)
public function get_st_settings() : ST_Settings 
{
	return this.st_settings;
}

@addMethod(CR4Player)
public function set_st_settings(st_settings : ST_Settings)
{
	this.st_settings.vanilla_calc_enable = st_settings.vanilla_calc_enable;
	this.st_settings.difficulty_multiplier = st_settings.difficulty_multiplier;
}

@wrapMethod(CR4Player) function OnSpawned(spawnData : SEntitySpawnData)
{
	st_update_st_settings();
	wrappedMethod(spawnData);
}
