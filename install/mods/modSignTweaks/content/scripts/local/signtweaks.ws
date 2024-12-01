//Pseudo macro
function ST_SIGNPOWER_BIAS_AARD_F() : float
{
	return 20.0f;
}

enum ST_DifficultyMultiplier {
	STDM_Invalid,
	STDM_Easy = 1,
	STDM_Normal = 2,
	STDM_Hard = 4
};

struct ST_Settings {
	var vanilla_calc_enable : bool;
	var difficulty_multiplier : ST_DifficultyMultiplier;
}

function st_update_st_settings()
{
	var st_settings : ST_Settings = ST_Settings(
		theGame.GetInGameConfigWrapper().GetVarValue('ST_Menu', 'ST_Vanilla_Calc_On'), 
		STDM_Invalid
	);

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
	thePlayer.set_st_settings(st_settings);
}

function st_calc_frost_death_chance(optional alternate_cast : bool) : int
{
	var dvdr : int;
	var st_settings : ST_Settings;
	var aardSP : SAbilityAttributeValue;
	
	st_settings = thePlayer.get_st_settings();
	if (st_settings.difficulty_multiplier == STDM_Invalid) {
		GetWitcherPlayer().DisplayHudMessage("ST_Error: invalid difficulty multiplier");
		return 0;
	}
	dvdr = (int)theGame.GetDifficultyMode() * (int)st_settings.difficulty_multiplier; //{EDM_Easy = 1, EDM_Medium = 2, EDM_Hard = 3, EDM_Hardcore = 4} * {STDM_Easy = 1, STDM_Normal = 2, STDM_Hard = 4}	
	aardSP = GetWitcherPlayer().GetTotalSignSpellPower(S_Magic_1);
	if (alternate_cast)
		dvdr *= 2;	

	return RoundF(aardSP.valueMultiplicative * ST_SIGNPOWER_BIAS_AARD_F() / dvdr);
}
