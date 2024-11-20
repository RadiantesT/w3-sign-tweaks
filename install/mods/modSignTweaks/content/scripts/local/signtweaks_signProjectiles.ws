@wrapMethod(W3AardProjectile) function ProcessMutation6(victimNPC : CNewNPC)
{
	var mutationAction : W3DamageAction;
	var min, max : SAbilityAttributeValue;
	var sp : SAbilityAttributeValue; 
	var dmgVal : float;
	var instaKill, applySlowdown : bool;
	var st_settings : ST_Settings;
	
	instaKill = false;
	st_settings = thePlayer.get_st_settings();
	//knockdown condition nicht gebraucht
	if(!victimNPC.IsImmuneToInstantKill()) {						
		if(RandRange(0,100) <= st_calc_frost_death_chance(signEntity.IsAlternateCast())) {							
			victimNPC.AddEffectDefault(EET_Frozen, this, "Mutation 6", true);
			mutationAction = new W3DamageAction in theGame.damageMgr;
			mutationAction.Initialize(action.attacker, victimNPC, this, "Mutation 6", EHRT_None, CPS_Undefined, false, false, true, false);
			mutationAction.SetInstantKill();
			mutationAction.SetForceExplosionDismemberment();
			mutationAction.SetIgnoreInstantKillCooldown();
			theGame.damageMgr.ProcessAction(mutationAction);
			delete mutationAction;
			instaKill = true;
		} else {			
			applySlowdown = true;			
			instaKill = false;
		}
	}	
	if(st_settings.vanilla_calc_enable) {
		if(!instaKill)
			wrappedMethod(victimNPC);
	} else {
		//vanilla copypasta_BEGIN
		if( applySlowdown /*&& !hasKnockdown*/ )
		{
			victimNPC.AddEffectDefault( EET_SlowdownFrost, this, "Mutation 6", true );
		}
		
		
		
		
		if( !instaKill )
		{			
			if ( owner.CanUseSkill(S_Magic_s06) )
			{
				
				sp = action.GetPowerStatValue();
				dmgVal += GetWitcherPlayer().GetSkillLevel(S_Magic_s06) * victimNPC.GetHealth() * ( 0.01 + 0.03 * LogF( sp.valueMultiplicative ) );
				
				action.AddDamage( theGame.params.DAMAGE_NAME_DIRECT, dmgVal );
				
				
				if(victimNPC.HasTag('eredin') || victimNPC.HasTag('imlerith') || victimNPC.HasTag('Caranthir'))
					theGame.damageMgr.ProcessAction( action );
			}
			
			if( !victimNPC.HasBuff( EET_Frozen ) && !victimNPC.HasTag('eredin') && !victimNPC.HasTag('imlerith') && !victimNPC.HasTag('Caranthir'))	
			{ 
				theGame.GetDefinitionsManager().GetAbilityAttributeValue( 'Mutation6', 'ForceDamage', min, max );
				dmgVal = CalculateAttributeValue( min );
				action.AddDamage( theGame.params.DAMAGE_NAME_FORCE, dmgVal );
				action.ClearEffects();
				action.SetProcessBuffsIfNoDamage( false );
				action.SetForceExplosionDismemberment();
				action.SetIgnoreInstantKillCooldown();
				action.SetBuffSourceName( "Mutation 6" );
				theGame.damageMgr.ProcessAction( action );
			}
		}	
		//vanilla copypasta_END
	}
}
