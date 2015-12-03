--[[
  Summon.lua
  Version: 15.12.03
  Copyright (C) 2015 Jeroen Petrus Broks
  
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

-- @IF IGNOREME
AblSpecialEffect = {}
-- @FI


function AblSpecialEffect.Summon(ag,ai,tg,ti,act,foefile)
local me = Fighter[ag][ai]
local tagletters = {}
local createfoe = {
                      File = foefile,
                      x = rand(25,300),
                      y = rand(250,450),
                      Level = rand(1,RPGStat.Stat(me.Tag,"Level"))                      
                  }
for i= 65, 91 do tagletters[#tagletters]=string.char(i) end
for i= 48, 57 do tagletters[#tagletters]=string.char(i) end
for i= 96,122 do tagletters[#tagletters]=string.char(i) end
local c = 1
-- Determine the letter we're gonna use on the combat bar.
repeat
if c>#tagletters then return false end
for _,foe in pairs(Fighters.Foe) do if foe.Letter~=tagletters[c] then createfoe.Letter=tagletters[c] end end
c=c+1
until createfoe.Letter
c = 0
repeat
for _,foe in pairs(Fighters.Foe) do if foe.Tag~="FOE_SUMMONED_"..c then createfoe.Tag="FOE_SUMMONED_"..c end end
c = c + 1
until createfoe.Tag
Fighters.Foe[#Fighters.Foe+1] = createfoe  -- Appears risky, but when records are missing, higher records will suddenly count once the
LoadFoe(createfoe,{})  
SpellAni.SingleHeal(ag,ai,tg,ti)
end