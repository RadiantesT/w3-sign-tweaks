# Sign Tweaks

A collection of personal changes on sign calculations.
Current changes:
- Piercing Cold mutation: added a kill chance to either combine or overwrite vanilla calculations (menu settings).
	- menu setting - `Vanilla Behaviour Enable`: enable/disable vanilla instant kill condition (freeze + knockdown)
	- frost kill %-modifier 01 - game difficulty: chance dynamically scales with the game difficulty
	- frost kill %-modifier 02 - `Sign Intensity Bias`: additional modifier if you aren't satisfied with the modifier 01 kill chance (too low/just perfect/too high)
	- menu setting - `Default Settings`: `Vanilla Behaviour Enable` \[On\], `Sign Intensity Bias` \[Standard\]
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
	
(for Linux users every `\` is a `/` obviously)
## How to Use
pending video or so
