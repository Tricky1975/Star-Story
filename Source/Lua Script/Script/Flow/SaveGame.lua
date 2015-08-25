--[[
/* 
  Save Game

  Copyright (C) 2015 Jeroen P. Broks

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

*/



Version: 15.06.27

]]
function Scan()
files = {}
PM = 0
dir = LAURA.GetSaveDir() .. "/" .. LAURA.User()
if Dir.DirExists(dir)==0 then return end
Dir.GetDir(dir)
local ak
for ak=1,Dir.DirLen() do
    table.insert(files,Dir.DirEntry(ak))
    end
end

function LoadPics()
imgback = Image.Load("GFX/Save/Back.png")
imgsave = Image.Load("GFX/Save/Save.png")
imgcncl = Image.Load("GFX/Save/Cancel.png")
imgname = Image.Load("GFX/Save/Name.png")
imglist = Image.Load("GFX/Save/FileList.png")
return true
end

function PerformSave()
LAURA.Flow("FIELD")
Image.Cls()
setfont("SaveName")
Red()
Image.DText("Saving",400,300,2,2)
Flip()
LAURA.Save(LAURA.User().."/"..SaveName)
Mini("The game has been saved",255,180,0)
end

function PerformCancel()
Mini("Saving the game has been cancelled",255,0,0)
LAURA.Flow("FIELD")
end

function MAIN_FLOW()
local mx,my = mousecoords()
-- If not loaded, load the pictures
imgloaded = imgloaded or LoadPics()
-- Clear screen
Image.Cls()
-- Draw the background + buttons
White()
Image.Draw(imgback,0,0)
Image.Draw(imgsave,0,200)
Image.Draw(imgcncl,0,250)
-- Type the savegame name (this come first as the mouse features late might spook this up otherwise)
Image.Draw(imgname,200,75)
SaveName = SaveName or ""
local ShowSaveName = SaveName
CurCnt = (CurCnt or 0) + 1
if CurCnt>5 then CurCnt=0; ShowCur = not ShowCur end
if ShowCur then ShowSaveName = ShowSaveName .."<" end
setfont("SaveName")
Image.Color(0,180,255)
Image.DText(ShowSaveName,215,80)
local ch = nil
for ak=65,65+26 do if keyhit(ak) then ch=ak end end
if keyhit(32) and SaveName~="" then ch=32 end
for ak=48,57 do if keyhit(ak) then ch=ak end end
if ch and Image.TextWidth(SaveName)<365 then SaveName = SaveName .. string.char(ch) return end
if keyhit(8) and SaveName~="" then SaveName = left(SaveName,len(SaveName)-1) end
if keyhit(13) and Str.Trim(SaveName)~="" then return PerformSave() end
if keyhit(27) then return PerformCancel() end
-- The file list
Image.Viewport(200,150,Image.Width(imglist),Image.Height(imglist))
local y,i,f
setfont('SaveFiles')
for i,f in ipairs(files) do
    y = 160 + ((i*15)-PM)
    if mx>200 and mx<200+Image.Width(imglist) and my>=y and my<=y+14 then
       Image.Color(0,180,255)
       if mousehit(1) then SaveName = f end
    else
       Image.Color(0,90,128)
       end
    Image.DText(f,205,y)   
    end
Image.Viewport(0,0,800,600)    
White()
Image.Draw(imglist,200,150)
-- The button clicks
if mx<100 and mousehit(1) then
   if my>200 and my<250 then return PerformSave() end
   if my>250 and my<300 then return PerformCancel() end
   end
-- Mouse
ShowMouse() 
-- Flip in the end
Flip()
-- Terminate LAURA II if the user requests to do so
LAURA.TerminateBye()
end