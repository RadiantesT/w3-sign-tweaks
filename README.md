# Sign Tweaks

A collection of personal changes on sign calculations.
Current changes:
- Piercing Cold mutation: added a kill chance to either combine or overwrite vanilla calculations (menu settings).
	- menu setting - `Vanilla Behaviour Enable`: enable/disable vanilla instant kill condition (freeze + knockdown)
	- frost kill %: dynamically scales with sign intensity
	- frost kill %-modifier 01 - game difficulty: chance dynamically scales with the game difficulty
	- frost kill %-modifier 02 - `Sign Intensity Bias`: additional modifier if you aren't satisfied with the modifier 01 kill chance (too low/just perfect/too high)
	- menu setting - `Default Settings`: `Vanilla Behaviour Enable` \[On\], `Sign Intensity Bias` \[Standard\]
Deprecated changes:
- Axii Delusion skill: reverted behaviour where lvl3 is weaker than at lvl1 or lvl2, meaning it didn't stun. Only in old gen. Not needed for next gen anymore.
## Installation
1. Download and extract the `.zip`.
2. Copy `install\mods\` folder into the game's root directory (for example `<somewhere in your drive>\GOG Games\The Witcher 3 Wild Hunt GOTY\`). There should be no conflicts.
3. Copy `install\bin\` folder into the game's root directory.
4. Add the mod menu into the game:
	1. add the line from `dx11filelist_addST.txt` to `dx11filelist.txt`, example:
	```
	audio.xml;
	gameplay.xml;
	hidden.xml;
	hud.xml;
	input.xml;
	localization.xml;
	gamma.xml;
	display.xml;
	graphicsdx11.xml;
	hdr.xml;
	modSignTweaks.xml; #<== this is the new line (without everything that comes after the ';')
	```
	2. do the same with `dx12filelist_addST.txt` into `dx12filelist.txt`
(for Linux users every `\` is a `/` obviously)
## How to Use
<a href="https://youtu.be/3cwY50A9_Mk">(Video Link)</a>
timestamps
- 00:00:00 Sign Tweaks settings + new kill percentage
- 00:00:34 game difficulty + new kill percentage
- 00:01:30 begin test \[Vanilla-off, Bias-easy, difficulty-easy\]
- 00:04:43 sword + potions -> sign intensity -> kill chance
- 00:07:04 play around with settings
- 00:08:00 2nd run
- 00:17:50 defeat the boss - the funny way