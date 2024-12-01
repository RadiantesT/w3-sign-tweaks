@wrapMethod(W3PlayerWitcher) function GetMutationLocalizedDescription( mutationType : EPlayerMutationType ) : string
{
	var pam : W3PlayerAbilityManager;
	var locKey : name;
	var arrStr : array< string >;
	var arr_int : array<int>;
	var min, max, sp : SAbilityAttributeValue;
	var val : float;
	
	pam = (W3PlayerAbilityManager)GetWitcherPlayer().abilityManager;
	locKey = pam.GetMutationDescriptionLocalizationKey( mutationType );
	
	if(mutationType == EPMT_Mutation6) {
		theGame.GetDefinitionsManager().GetAbilityAttributeValue( 'Mutation6', 'full_freeze_chance', min, max );
		arrStr.PushBack( NoTrailZeros( 100 * min.valueMultiplicative ) );	
		
		theGame.GetDefinitionsManager().GetAbilityAttributeValue( 'Mutation6', 'ForceDamage', min, max );
		sp = GetTotalSignSpellPower( S_Magic_1 );
		val = sp.valueAdditive + sp.valueMultiplicative * ( sp.valueBase + min.valueAdditive );
		arrStr.PushBack( NoTrailZeros( RoundMath( val ) ) );	
		//modTKM_BEGIN
		arr_int.PushBack(st_calc_frost_death_chance());
		arr_int.PushBack(st_calc_frost_death_chance(true));
		
		return GetLocStringByKeyExtWithParams(locKey, , , arrStr) + GetLocStringByKeyExtWithParams("ST_mutation6_frost_instakill_description", arr_int, , );
		//modTKM_END
	}
	
	return wrappedMethod(mutationType);	
}
