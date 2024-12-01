@addField(CR4Player)
private var st_settings : ST_Settings;

@addMethod(CR4Player)
public function get_st_settings() : ST_Settings 
{
	if (st_settings.difficulty_multiplier == STDM_Invalid)
		st_update_st_settings();
	
	return st_settings;
}

@addMethod(CR4Player)
public function st_update_st_settings()
{
	st_settings.vanilla_calc_enable = theGame.GetInGameConfigWrapper().GetVarValue('ST_Menu', 'ST_Vanilla_Calc_On');
	//ERROR: xml Option value not returned by GetVarValue (ex. Option values {1, 2, 4}, instead {0, 1, 2} returned)
	//st_settings.difficulty_multiplier = StringToInt(theGame.GetInGameConfigWrapper().GetVarValue('ST_Menu', 'ST_Difficulty_Multiplier'));
	switch (StringToInt(theGame.GetInGameConfigWrapper().GetVarValue('ST_Menu', 'ST_Difficulty_Multiplier'))) {
	case 0:
		st_settings.difficulty_multiplier = STDM_Easy;
		break;
	case 1:
		st_settings.difficulty_multiplier = STDM_Normal;
		break;
	case 2:
		st_settings.difficulty_multiplier = STDM_Hard;
		break;
	default:
		st_settings.difficulty_multiplier = STDM_Invalid;
	}	
}
