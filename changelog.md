# Sign Tweaks changelog
v1.0.2412.4
- initial GitHub release

v1.0.2411.3
- viele Namen geändert

v1.0.2411.2
xml - geändert sodass auch ST_Difficulty_Multiplier Option value<array> = {0, 1 , 2} -> robust
ws - difficulty_multiplier : ST_DifficultyMultiplier nicht direkt sondern über switch-case
	(alternativ ausrechnen: Easy 2^0, Normal 2^1, Hard 2^2)
Erklärung:
- GetVarValue sollte eig {1,2,4} sein, ist aber {0,1,2}
- 1.0.2411.1 angepasst auf {0,1,2} aber nicht robust für wenn {1,2,4} später geht...

v1.0.2411.1
- add two configure params
1. enable/disable vanilla behaviour
2. additional difficulty modifier for more customisation
- menu options for customisation added
- languages: de, en

v1.0.2411.0
- fully merge free

v1.0.2411.0pre
- wie v4 von 1_32
- paar strings abgeändert
- sprachen de, en, rest kopie von en