--[[
**********************************************
  
  Synchronize.lua
  (c) Jeroen Broks, 2015, 2016, All Rights Reserved.
  
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
 
version: 16.08.11
]]



----------------------------------------------------------------------------------------
-- This file ONLY works when GameJolt active.                                         --
-- Don't even try to strip all GameJolt security settings out of this file            --
-- As you will only get your game crashed with 'nil' values on the moment             --
-- the game tries to contact GameJolt (not to mention that the GameJolt routines      --
-- do not accept modified versions of the game.                                       --
--                                                                                    --
-- And besides (that is quite obvious), this script cannot catch the username or      --
-- token anyway, and that is required to contact GameJolt                             --
----------------------------------------------------------------------------------------


function Synchronize()
	CSay("Synchronize achievements ... ")
	-- Odd as it may seem this must be done, or the game cannot operate at all of ANY action.
	LoadFlowsScripts()
	LoadBaseGraphics()
	-- And here is the actual action.
	MS.LoadNew("ACH","Script/Flow/Achievements.lua")
  -- @IF *GAMEJOLT
	MS.Run("ACH","SynchronizeGameJolt")
	-- @FI
	-- @IF *ANNA
	MS.Run("ACH","SynchronizeAnna")
	-- @FI
	Console.Write("This program will close in a few seconds.",255,180,0)
	Console.Show()
	Console.Flip()
	Time.Sleep(5000)
	Sys.Bye()		
end



-- Have a proper error when we cannot deal with GameJolt. (This script is only loaded during a synchronizing round anyway).
if not Synchronize then Sys.Error("Cannot Synchronize!","Desc,This routine ONLY works when you have;,Succesfully logged in on GameJolt;,Sorry!") end
