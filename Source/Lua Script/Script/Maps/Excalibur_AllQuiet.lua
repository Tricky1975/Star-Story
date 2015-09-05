--[[
**********************************************
  
  Excalibur_AllQuiet.lua
  (c) Jeroen Broks, 2015, All Rights Reserved.
  
  This file contains material that is related 
  to a storyline that is which is strictly
  copyrighted to Jeroen Broks.
  
  This file may only be used in an unmodified
  form with an unmodified version of the 
  software this file belongs to.
  
  You may use this file for your study to see
  how I solved certain things in the creation
  of this project to see if you find valuable
  leads for the creation of your own.
  
  Mostly this file comes along with a project
  that is for most part released under an
  open source license and that means that if
  you use that code with this file removed
  from it, you can use it under that license.
  Please check out the other files to find out
  which license applies.
  This file comes 'as-is' and in no possible
  way the author can be held responsible of
  any form of damages that may occur due to 
  the usage of this file
  
  
 **********************************************
 
version: 15.09.05
]]
function NoBusiness()
MapText("NOBUSINESS")
end

function SetDoor(Tag,x)
Doors=Doors or {}
Doors[Tag] = {ox = Maps.Obj.Obj(Tag).X}
Maps.Obj.Obj(Tag).X = Maps.Obj.Obj(Tag).X + x
end

function GALE_OnLoad()
Music("Excalibur/Blip Stream.ogg")
SetDoor("LeftDoorSickBay",-40)
SetDoor("RightDoorSickBay",40)
if RPGChar.CharExists("Briggs")==1 then RPGChar.DelChar("Briggs") end
end

function MAP_FLOW()
local k,v
for k,v in spairs(Doors) do
    if Maps.Obj.Obj(k).X<v.ox then Maps.Obj.Obj(k).X = Maps.Obj.Obj(k).X + 1 end
    if Maps.Obj.Obj(k).X>v.ox then Maps.Obj.Obj(k).X = Maps.Obj.Obj(k).X - 1 end
    end
end
