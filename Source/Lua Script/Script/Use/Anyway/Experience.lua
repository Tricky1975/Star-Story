--[[
  Experience.lua
  Version: 15.09.03
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
-- Nee, mijn mede brabanders
-- We hebben het alleen maar over experience en niet over "WC Experience" :-P


function EXPGetCharList(p1,p2)
local ret1,ret2 
local chl,exp = p1,p2
if not exp then exp=p1; chl=nil end
ret1,ret2 = ({
    ["table"] = function(p1,p2)
                return p1,p2
                end,
    ["string"] = function(p1,p2)
                 return {p1},p2
                 end,
    ["nil"] = function(p1,p2)
              local ret = {}
              local ch
              for ak=0,5 do 
                  ch = RPGChar.PartyTag(ak)
                  if ch~="" then table.insert(ret,ch) end
                  end
              end })[type(chl)](chl,exp)                                   
return ret1,ret2
end

function GrandFixedExperience(cha,exp)
local chl,x = EXPGetCharList(cha,exp)
local ch
for ch in each (chl) do
    RPGChar.Points(ch,"EXP").Inc(exp)
    end
end

function GrandExperienceOnLevel(c1,c2)
local chl,lv = EXPGetCharList(c1,c2)
local ch
for ch in each (chl) do
    RPGChar.Points(ch,"EXP").Inc((RPGChar.Stat(ch,"Level")/lv)*250)
    end
end    

function GrandEventExperience(c1,c2)
local chl,lv = EXPGetCharList(c1,c2)
local ch
for ch in each (chl) do
    RPGChar.Points(ch,"EXP").Inc((RPGChar.Stat(ch,"Level")/lv)*rand(200,200+(320-(skill*100))))
    end
end    