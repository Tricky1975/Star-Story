--[[
  Zombie.lua
  Version: 16.09.12
  Copyright (C) 2016 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]


-- Version 16.09.11



Data = {
	Name = "Zombie",
	Desc = "Mutated dead humans\nartificially made alive.\nNow WHO would do such a thing?",
	ImageFile = "Reg/Zombie.png",
	AI = "Default",
	EleRes_Fire = 1,
	EleRes_Wind = 4,
	EleRes_Water = 4,
	EleRes_Earth = 3,
	EleRes_Frost = 5,
	EleRes_Lightning = 2,
	EleRes_Light = 0,
	EleRes_Dark = 6,
	EleRes_Healing = 0,
	EleRes_DarkHealing = 6,
	Stat = {
		["Strength"] = {1,500},
		["Defense"] = {1,500},
		["Will"] = {1,500},
		["Resistance"] = {1,500},
		["Agility"] = {1,100},
		["Accuracy"] = {1,500},
		["Evasion"] = {1,5},
		["HP"] = {1,1000},
		["AP"] = {0,0},
		["LevelRange"] = {1,100},
},
	StatusResistance = {
		["Poison"] = 100   --[[ #1 ]],
		["Paralysis"] = 100   --[[ #2 ]],
		["Disease"] = 100   --[[ #3 ]],
		["Will"] = 100   --[[ #4 ]],
		["Block"] = 100   --[[ #5 ]],
		["Death"] = 100   --[[ #6 ]],
		["Damned"] = 100   --[[ #7 ]],
	},
	Acts = {}, -- Data itself defined below
	ActMinLevel = {}, -- Data itself defined below
	ItemDrop = {}, -- Data itself defined below
	ItemSteal = {} -- Data itself definded below
}


local temp


Data.ActMinLevel["Sys.Attack"] = 0		for ak=1,100 do table.insert(Data.Acts,"Sys.Attack") end
Data.ActMinLevel["Abl.ABL_EXHURU_KAKSI"] = 20		for ak=1,9 do table.insert(Data.Acts,"Abl.ABL_EXHURU_KAKSI") end
Data.ActMinLevel["Abl.ABL_EXHURU_KOLME"] = 30		for ak=1,8 do table.insert(Data.Acts,"Abl.ABL_EXHURU_KOLME") end
Data.ActMinLevel["Abl.ABL_EXHURU_KUUSI"] = 50		for ak=1,6 do table.insert(Data.Acts,"Abl.ABL_EXHURU_KUUSI") end
Data.ActMinLevel["Abl.ABL_EXHURU_NELJA"] = 40		for ak=1,7 do table.insert(Data.Acts,"Abl.ABL_EXHURU_NELJA") end
Data.ActMinLevel["Abl.ABL_EXHURU_YKSI"] = 10		for ak=1,10 do table.insert(Data.Acts,"Abl.ABL_EXHURU_YKSI") end
Data.ActMinLevel["Abl.ABL_FOE_ASSIMILATE"] = 0		for ak=1,25 do table.insert(Data.Acts,"Abl.ABL_FOE_ASSIMILATE") end
Data.ActMinLevel["Abl.ABL_FOE_DAMNYOU"] = 90		for ak=1,10 do table.insert(Data.Acts,"Abl.ABL_FOE_DAMNYOU") end
Data.ActMinLevel["Abl.ABL_FOE_DEATH"] = 10		for ak=1,10 do table.insert(Data.Acts,"Abl.ABL_FOE_DEATH") end
Data.ActMinLevel["Abl.ABL_FOE_HORROR"] = 80		for ak=1,5 do table.insert(Data.Acts,"Abl.ABL_FOE_HORROR") end
Data.ActMinLevel["Abl.ABL_FOE_IDDQD"] = 200		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_IDDQD") end
Data.ActMinLevel["Abl.ITM_EPO"] = 200		for ak=1,1 do table.insert(Data.Acts,"Abl.ITM_EPO") end
temp = { ITM='ITM_EQP_EMERALD', LVL=100, VLT=false }
for ak=1,1 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_FISH', LVL=10, VLT=false }
for ak=1,10 do table.insert(Data.ItemDrop ,temp) end
for ak=1,10 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_PHAN_LEVELAPPLE', LVL=1, VLT=false }
for ak=1,1 do table.insert(Data.ItemDrop ,temp) end
for ak=1,1 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_SHIT', LVL=80, VLT=false }
for ak=1,1 do table.insert(Data.ItemDrop ,temp) end
for ak=1,1 do table.insert(Data.ItemSteal,temp) end


return Data
