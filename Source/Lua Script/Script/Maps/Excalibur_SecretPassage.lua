--[[
**********************************************
  
  Excalibur_SecretPassage.lua
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
 
version: 15.09.17
]]
function GALE_OnLoad()
Music('Dungeon/Spiedkiks_-_05_-_Freak_Boutique.ogg')
end


function MAP_FLOW()
local ak,o
for ak=0,10 do
    o = Maps.Obj.Obj("CLOUD"..ak)
    o.X = Maps.CamX
    o.Y = Maps.CamY
    o.InsertX = (-o.X) * (ak/0.75)
    o.InsertY = (-o.Y) * (ak/0.75)
    end
end
