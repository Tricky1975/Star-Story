--[[
**********************************************
  
  ABL_FOE_CURSEDHEALING.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
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
 
version: 17.04.14
]]
ret = {
	["ABL_AP"] = 0,
	["ABL_Pose"] = "Cast",
	["APRecover"] = 100,
	["APRecoverType"] = "Percent",
	["ActSpeed"] = 250,
	["AttackElement"] = "Non-Elemental",
	["AttackStat"] = "Strength",
	["Buff_AP"] = -10,
	["Buff_Accuracy"] = -5,
	["Buff_Agility"] = -5,
	["Buff_Defense"] = -25,
	["Buff_Evasion"] = -100,
	["Buff_HP"] = -20,
	["Buff_Resistance"] = -25,
	["Buff_Strength"] = -5,
	["Buff_Will"] = -5,
	["CauseAmnesia"] = true,
	["CauseBagLock"] = true,
	["CauseConfusion"] = true,
	["CauseDisease"] = true,
	["CauseHandicapped"] = true,
	["CauseParalysis"] = true,
	["CausePoison"] = true,
	["CauseSleep"] = true,
	["CauseTerrified"] = true,
	["DefenseStat"] = "Defense",
	["Healing"] = 100,
	["HealingType"] = "Percent",
	["Icon"] = "GFX/Elements/Dark.png",
	["ItemType"] = "Consumable",
	["Name"] = "Cursed Healing",
	["Target"] = "1F",
	["UseCombat"] = true,
	["UseField"] = true}

return ret

-- This file is an automatically generated file!

