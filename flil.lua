-- ==========================================
-- 闪光 · zmV5悬浮窗版
-- 已去除所有作者信息
-- ==========================================
local Players=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local Lighting=game:GetService("Lighting")
local Workspace=game:GetService("Workspace")
local TweenService=game:GetService("TweenService")
local LP=Players.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")
local Camera=Workspace.CurrentCamera

if PG:FindFirstChild("FlashGui")then PG.FlashGui:Destroy()end

-- ============ 主 GUI ============
local Gui=Instance.new("ScreenGui")
Gui.Name="FlashGui"
Gui.ResetOnSpawn=false
Gui.DisplayOrder=999999
Gui.IgnoreGuiInset=true
Gui.Parent=PG

-- 悬浮球
local Orb=Instance.new("TextButton")
Orb.Size=UDim2.new(0,50,0,50)
Orb.Position=UDim2.new(0.5,-25,0,50)
Orb.BackgroundColor3=Color3.fromRGB(255,255,255)
Orb.BackgroundTransparency=0.72
Orb.Text="⚡"
Orb.TextColor3=Color3.fromRGB(255,255,255)
Orb.TextSize=22
Orb.Font=Enum.Font.GothamBold
Orb.BorderSizePixel=0
Orb.AutoButtonColor=false
Orb.Active=true
Orb.ZIndex=999999
Orb.Parent=Gui
Instance.new("UICorner",Orb).CornerRadius=UDim.new(1,0)

local OrbStroke=Instance.new("UIStroke",Orb)
OrbStroke.Thickness=2.5
OrbStroke.Color=Color3.fromRGB(255,180,210)
OrbStroke.Transparency=.15
local OrbSG=Instance.new("UIGradient",OrbStroke)
OrbSG.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,120,180)),
ColorSequenceKeypoint.new(.25,Color3.fromRGB(255,190,120)),
ColorSequenceKeypoint.new(.5,Color3.fromRGB(120,220,180)),
ColorSequenceKeypoint.new(.75,Color3.fromRGB(120,180,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,120,180))})
task.spawn(function()
while Orb.Parent do
OrbSG.Offset=Vector2.new(math.sin(tick()*1.5)*0.5,tick()*0.3%1)
task.wait(.03)
end end)

local OG=Instance.new("UIGradient",Orb)
OG.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,140,190)),
ColorSequenceKeypoint.new(.25,Color3.fromRGB(255,200,140)),
ColorSequenceKeypoint.new(.5,Color3.fromRGB(140,230,190)),
ColorSequenceKeypoint.new(.75,Color3.fromRGB(140,190,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,140,190))})
OG.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75),
NumberSequenceKeypoint.new(.5,0.55),
NumberSequenceKeypoint.new(1,0.75)})
task.spawn(function()
while Orb.Parent do
OG.Offset=Vector2.new(math.sin(tick()*1.2)*0.4,tick()*0.18%1)
task.wait(.03)
end end)

local OrbHi=Instance.new("Frame")
OrbHi.Size=UDim2.new(0.7,0,0.35,0)
OrbHi.Position=UDim2.new(0.15,0,0.08,0)
OrbHi.BackgroundColor3=Color3.fromRGB(255,255,255)
OrbHi.BackgroundTransparency=0.6
OrbHi.BorderSizePixel=0
OrbHi.ZIndex=3
OrbHi.Parent=Orb
Instance.new("UICorner",OrbHi).CornerRadius=UDim.new(1,0)

local OrbShade=Instance.new("Frame")
OrbShade.Size=UDim2.new(0.85,0,0.5,0)
OrbShade.Position=UDim2.new(0.075,0,0.48,0)
OrbShade.BackgroundColor3=Color3.fromRGB(0,0,0)
OrbShade.BackgroundTransparency=0.88
OrbShade.BorderSizePixel=0
OrbShade.ZIndex=2
OrbShade.Parent=Orb
Instance.new("UICorner",OrbShade).CornerRadius=UDim.new(1,0)

-- 面板
local P=Instance.new("Frame")
P.Size=UDim2.new(0,340,0,240)
P.Position=UDim2.new(.5,0,.5,0)
P.AnchorPoint=Vector2.new(.5,.5)
P.BackgroundColor3=Color3.fromRGB(255,255,255)
P.BackgroundTransparency=0.82
P.BorderSizePixel=0
P.Visible=false
P.ZIndex=999998
P.ClipsDescendants=true
P.Parent=Gui
Instance.new("UICorner",P).CornerRadius=UDim.new(0,20)

local PStroke=Instance.new("UIStroke",P)
PStroke.Thickness=2.2
PStroke.Color=Color3.fromRGB(255,180,210)
PStroke.Transparency=.15
local PSG=Instance.new("UIGradient",PStroke)
PSG.Color=OrbSG.Color
task.spawn(function()
while P.Parent do
PSG.Offset=Vector2.new(math.sin(tick()*1.2)*0.5,tick()*0.25%1)
task.wait(.03)
end end)

local PGrad=Instance.new("UIGradient",P)
PGrad.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,150,200)),
ColorSequenceKeypoint.new(.25,Color3.fromRGB(255,200,150)),
ColorSequenceKeypoint.new(.5,Color3.fromRGB(150,230,200)),
ColorSequenceKeypoint.new(.75,Color3.fromRGB(150,190,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,150,200))})
PGrad.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,.9),
NumberSequenceKeypoint.new(.5,.84),
NumberSequenceKeypoint.new(1,.9)})
task.spawn(function()
while P.Parent do
PGrad.Offset=Vector2.new(math.sin(tick()*0.8)*0.4,tick()*0.12%1)
task.wait(.03)
end end)

local TopHi=Instance.new("Frame")
TopHi.Size=UDim2.new(1,-30,0,1)
TopHi.Position=UDim2.new(0,15,0,1)
TopHi.BackgroundColor3=Color3.fromRGB(255,255,255)
TopHi.BackgroundTransparency=0.3
TopHi.BorderSizePixel=0
TopHi.ZIndex=3
TopHi.Parent=P

local BotShade=Instance.new("Frame")
BotShade.Size=UDim2.new(1,-30,0,1)
BotShade.Position=UDim2.new(0,15,1,-2)
BotShade.BackgroundColor3=Color3.fromRGB(0,0,0)
BotShade.BackgroundTransparency=0.75
BotShade.BorderSizePixel=0
BotShade.ZIndex=3
BotShade.Parent=P

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(1,-16,0,20)
Title.Position=UDim2.new(0,8,0,4)
Title.BackgroundTransparency=1
Title.Text="⚡ 闪光"
Title.TextColor3=Color3.fromRGB(255,255,255)
Title.TextStrokeTransparency=0
Title.TextStrokeColor3=Color3.fromRGB(0,0,0)
Title.TextSize=12
Title.Font=Enum.Font.GothamBold
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.ZIndex=5
Title.Parent=P

-- 左右分栏
local Container=Instance.new("Frame")
Container.Size=UDim2.new(1,-12,1,-30)
Container.Position=UDim2.new(0,6,0,26)
Container.BackgroundTransparency=1
Container.ZIndex=2
Container.Parent=P

local Sidebar=Instance.new("ScrollingFrame")
Sidebar.Size=UDim2.new(0,54,1,0)
Sidebar.BackgroundColor3=Color3.fromRGB(20,20,35)
Sidebar.BackgroundTransparency=0.3
Sidebar.BorderSizePixel=0
Sidebar.ScrollBarThickness=2
Sidebar.ScrollBarImageColor3=Color3.fromRGB(255,255,255)
Sidebar.ScrollBarImageTransparency=.4
Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y
Sidebar.CanvasSize=UDim2.new(0,0,0,0)
Sidebar.ZIndex=3
Sidebar.Parent=Container
Instance.new("UICorner",Sidebar).CornerRadius=UDim.new(0,12)

local SideStroke=Instance.new("UIStroke",Sidebar)
SideStroke.Thickness=1.5
SideStroke.Color=Color3.fromRGB(255,180,210)
SideStroke.Transparency=.3

local SideLayout=Instance.new("UIListLayout",Sidebar)
SideLayout.Padding=UDim.new(0,3)
SideLayout.SortOrder=Enum.SortOrder.LayoutOrder
SideLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center

local SidePad=Instance.new("UIPadding",Sidebar)
SidePad.PaddingTop=UDim.new(0,5)
SidePad.PaddingBottom=UDim.new(0,5)

local Content=Instance.new("Frame")
Content.Size=UDim2.new(1,-60,1,0)
Content.Position=UDim2.new(0,60,0,0)
Content.BackgroundTransparency=1
Content.ZIndex=3
Content.Parent=Container

-- 页面系统
local pages={}
local sideButtons={}

local function createPage(key)
local page=Instance.new("ScrollingFrame")
page.Size=UDim2.new(1,0,1,0)
page.BackgroundTransparency=1
page.BorderSizePixel=0
page.ScrollBarThickness=2
page.ScrollBarImageColor3=Color3.fromRGB(255,255,255)
page.ScrollBarImageTransparency=.3
page.AutomaticCanvasSize=Enum.AutomaticSize.Y
page.Visible=false
page.ZIndex=3
page.Parent=Content
local l=Instance.new("UIListLayout",page)
l.Padding=UDim.new(0,4)
l.SortOrder=Enum.SortOrder.LayoutOrder
local p=Instance.new("UIPadding",page)
p.PaddingLeft=UDim.new(0,3)
p.PaddingRight=UDim.new(0,3)
p.PaddingTop=UDim.new(0,3)
p.PaddingBottom=UDim.new(0,6)
pages[key]={page=page,order=0}
end

local function nextOrder(key)
pages[key].order=pages[key].order+1
return pages[key].order
end

local function addCategory(key,label)
local btn=Instance.new("TextButton")
btn.Size=UDim2.new(1,-8,0,24)
btn.BackgroundColor3=Color3.fromRGB(40,40,60)
btn.Text=label
btn.TextColor3=Color3.fromRGB(255,255,255)
btn.TextStrokeTransparency=0.2
btn.TextStrokeColor3=Color3.fromRGB(0,0,0)
btn.TextSize=11
btn.Font=Enum.Font.GothamBold
btn.BorderSizePixel=0
btn.ZIndex=4
btn.Parent=Sidebar
Instance.new("UICorner",btn).CornerRadius=UDim.new(0,9)
local bs=Instance.new("UIStroke",btn)
bs.Thickness=1.2
bs.Color=Color3.fromRGB(255,180,210)
bs.Transparency=.35
btn.MouseButton1Click:Connect(function()
for _,v in pairs(pages)do v.page.Visible=false end
for _,v in pairs(sideButtons)do
v.BackgroundColor3=Color3.fromRGB(40,40,60)
v.TextColor3=Color3.fromRGB(255,255,255)
end
pages[key].page.Visible=true
btn.BackgroundColor3=Color3.fromRGB(255,80,160)
btn.TextColor3=Color3.fromRGB(255,255,255)
end)
sideButtons[key]=btn
end

local function addLabel(key,text)
local l=Instance.new("TextLabel")
l.Size=UDim2.new(1,0,0,18)
l.BackgroundColor3=Color3.fromRGB(40,40,60)
l.Text="  "..text
l.TextColor3=Color3.fromRGB(255,240,120)
l.TextStrokeTransparency=0.3
l.TextStrokeColor3=Color3.fromRGB(0,0,0)
l.TextSize=10
l.Font=Enum.Font.GothamBold
l.TextXAlignment=Enum.TextXAlignment.Left
l.LayoutOrder=nextOrder(key)
l.ZIndex=4
l.Parent=pages[key].page
Instance.new("UICorner",l).CornerRadius=UDim.new(0,5)
end

local function makeButton(key,text,callback)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,28)
b.BackgroundColor3=Color3.fromRGB(50,50,75)
b.Text=text
b.TextColor3=Color3.fromRGB(255,255,255)
b.TextStrokeTransparency=0.2
b.TextStrokeColor3=Color3.fromRGB(0,0,0)
b.TextSize=11
b.Font=Enum.Font.GothamBold
b.BorderSizePixel=0
b.LayoutOrder=nextOrder(key)
b.ZIndex=4
b.Parent=pages[key].page
Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)
local bs=Instance.new("UIStroke",b)
bs.Thickness=1.2
bs.Color=Color3.fromRGB(255,180,210)
bs.Transparency=.25
b.MouseButton1Click:Connect(callback)
return b
end

local function makeToggle(key,text,onFunc,offFunc)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,30)
b.BackgroundColor3=Color3.fromRGB(50,50,75)
b.Text=text.."  ○"
b.TextColor3=Color3.fromRGB(255,255,255)
b.TextStrokeTransparency=0.2
b.TextStrokeColor3=Color3.fromRGB(0,0,0)
b.TextSize=11
b.Font=Enum.Font.GothamBold
b.BorderSizePixel=0
b.LayoutOrder=nextOrder(key)
b.ZIndex=4
b.Parent=pages[key].page
Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)
local stroke=Instance.new("UIStroke",b)
stroke.Thickness=1.2
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35
local state=false
local function update()
if state then
b.Text=text.."  ●"
b.BackgroundColor3=Color3.fromRGB(90,200,140)
stroke.Color=Color3.fromRGB(180,255,200)
stroke.Transparency=.15
else
b.Text=text.."  ○"
b.BackgroundColor3=Color3.fromRGB(50,50,75)
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35
end
end
update()
b.MouseButton1Click:Connect(function()
state=not state
update()
if state then if onFunc then pcall(onFunc)end
else if offFunc then pcall(offFunc)end end
end)
return b
end

-- 带滑块的 toggle
local function makeToggleWithSlider(key,text,minVal,maxVal,defaultVal,onFunc,offFunc)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,30)
b.BackgroundColor3=Color3.fromRGB(50,50,75)
b.Text=text.."  ○"
b.TextColor3=Color3.fromRGB(255,255,255)
b.TextStrokeTransparency=0.2
b.TextStrokeColor3=Color3.fromRGB(0,0,0)
b.TextSize=11
b.Font=Enum.Font.GothamBold
b.BorderSizePixel=0
b.LayoutOrder=nextOrder(key)
b.ZIndex=4
b.Parent=pages[key].page
Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)
local stroke=Instance.new("UIStroke",b)
stroke.Thickness=1.2
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35

local panel=Instance.new("Frame")
panel.Size=UDim2.new(1,0,0,46)
panel.BackgroundColor3=Color3.fromRGB(30,30,50)
panel.BorderSizePixel=0
panel.LayoutOrder=nextOrder(key)
panel.Visible=false
panel.ZIndex=4
panel.Parent=pages[key].page
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,9)
local ps=Instance.new("UIStroke",panel)
ps.Thickness=1
ps.Color=Color3.fromRGB(255,180,210)
ps.Transparency=.35

local valueLabel=Instance.new("TextLabel")
valueLabel.Size=UDim2.new(1,-14,0,14)
valueLabel.Position=UDim2.new(0,7,0,3)
valueLabel.BackgroundTransparency=1
valueLabel.Text=text..": "..defaultVal
valueLabel.TextColor3=Color3.fromRGB(255,255,255)
valueLabel.TextStrokeTransparency=0.3
valueLabel.TextStrokeColor3=Color3.fromRGB(0,0,0)
valueLabel.TextSize=10
valueLabel.Font=Enum.Font.GothamBold
valueLabel.TextXAlignment=Enum.TextXAlignment.Left
valueLabel.ZIndex=5
valueLabel.Parent=panel

local bar=Instance.new("Frame")
bar.Size=UDim2.new(1,-30,0,8)
bar.Position=UDim2.new(0,15,0,28)
bar.BackgroundColor3=Color3.fromRGB(255,255,255)
bar.BackgroundTransparency=.5
bar.BorderSizePixel=0
bar.ZIndex=5
bar.Parent=panel
Instance.new("UICorner",bar).CornerRadius=UDim.new(1,0)

local fill=Instance.new("Frame")
fill.Size=UDim2.new(0,0,1,0)
fill.BackgroundColor3=Color3.fromRGB(255,80,160)
fill.BorderSizePixel=0
fill.ZIndex=6
fill.Parent=bar
Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)

local knob=Instance.new("TextButton")
knob.Size=UDim2.new(0,14,0,14)
knob.AnchorPoint=Vector2.new(.5,.5)
knob.Position=UDim2.new(0,0,.5,0)
knob.BackgroundColor3=Color3.new(1,1,1)
knob.Text=""
knob.BorderSizePixel=0
knob.ZIndex=7
knob.Parent=bar
Instance.new("UICorner",knob).CornerRadius=UDim.new(1,0)
local ks=Instance.new("UIStroke",knob)
ks.Thickness=1.5
ks.Color=Color3.fromRGB(255,80,160)

local state=false
local currentValue=defaultVal

local function updateSlider(alpha)
alpha=math.clamp(alpha,0,1)
local v=math.floor(minVal+(maxVal-minVal)*alpha)
currentValue=v
fill.Size=UDim2.new(alpha,0,1,0)
knob.Position=UDim2.new(alpha,0,.5,0)
valueLabel.Text=text..": "..v
return v
end
updateSlider((defaultVal-minVal)/(maxVal-minVal))

local sliderDragging=false
local function getAlpha(x)
local sx=bar.AbsolutePosition.X
local sw=bar.AbsoluteSize.X
if sw<=0 then return 0 end
return math.clamp((x-sx)/sw,0,1)
end

bar.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1
or i.UserInputType==Enum.UserInputType.Touch then
sliderDragging=true
updateSlider(getAlpha(i.Position.X))
if state and onFunc then pcall(onFunc,currentValue)end
end
end)
UIS.InputChanged:Connect(function(i)
if not sliderDragging then return end
if i.UserInputType==Enum.UserInputType.MouseMovement
or i.UserInputType==Enum.UserInputType.Touch then
updateSlider(getAlpha(i.Position.X))
if state and onFunc then pcall(onFunc,currentValue)end
end
end)
UIS.InputEnded:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1
or i.UserInputType==Enum.UserInputType.Touch then
sliderDragging=false
end
end)

b.MouseButton1Click:Connect(function()
state=not state
if state then
b.Text=text.."  ●"
b.BackgroundColor3=Color3.fromRGB(90,200,140)
stroke.Color=Color3.fromRGB(180,255,200)
stroke.Transparency=.15
panel.Visible=true
if onFunc then pcall(onFunc,currentValue)end
else
b.Text=text.."  ○"
b.BackgroundColor3=Color3.fromRGB(50,50,75)
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35
panel.Visible=false
if offFunc then pcall(offFunc)end
end
end)
return b
end

local StatusLabel=Instance.new("TextLabel")
StatusLabel.Size=UDim2.new(1,-16,0,16)
StatusLabel.Position=UDim2.new(0,8,1,-20)
StatusLabel.BackgroundColor3=Color3.fromRGB(0,0,0)
StatusLabel.BackgroundTransparency=.3
StatusLabel.Text="就绪"
StatusLabel.TextColor3=Color3.fromRGB(120,255,180)
StatusLabel.TextStrokeTransparency=0.2
StatusLabel.TextStrokeColor3=Color3.fromRGB(0,0,0)
StatusLabel.TextSize=10
StatusLabel.Font=Enum.Font.GothamBold
StatusLabel.TextXAlignment=Enum.TextXAlignment.Center
StatusLabel.ZIndex=6
StatusLabel.Parent=P
Instance.new("UICorner",StatusLabel).CornerRadius=UDim.new(0,6)

local function setStatus(txt,ok)
StatusLabel.Text=txt
StatusLabel.TextColor3=ok and Color3.fromRGB(120,255,180)or Color3.fromRGB(255,120,120)
end

-- 分类
createPage("main")
createPage("aim")
createPage("visual")
createPage("combat")
createPage("settings")

addCategory("main","主要")
addCategory("aim","自瞄")
addCategory("visual","透视")
addCategory("combat","战斗")
addCategory("settings","设置")

pages.main.page.Visible=true
sideButtons.main.BackgroundColor3=Color3.fromRGB(255,80,160)
sideButtons.main.TextColor3=Color3.new(1,1,1)

-- ==========================================
-- 一、主要功能区（移动）
-- ==========================================
addLabel("main","· 移动功能")

local InfiniteJumpEnabled=false
local JumpConnection=nil

local function setupInfiniteJump()
if JumpConnection then
JumpConnection:Disconnect()
JumpConnection=nil
end
if InfiniteJumpEnabled then
JumpConnection=UIS.JumpRequest:Connect(function()
pcall(function()
local char=LP.Character
if char and char:FindFirstChild("Humanoid")then
char.Humanoid:ChangeState("Jumping")
end
end)
end)
end
end

makeToggle("main","无限跳跃",function()
InfiniteJumpEnabled=true
setupInfiniteJump()
setStatus("✓ 无限跳跃开启",true)
end,function()
InfiniteJumpEnabled=false
setupInfiniteJump()
setStatus("无限跳跃关闭",true)
end)

makeToggleWithSlider("main","重力设置",0,500,196,
function(v)
Workspace.Gravity=v
setStatus("✓ 重力 "..v,true)
end,
function()
Workspace.Gravity=196
setStatus("重力恢复",true)
end)

local SpeedValue=16
local SpeedEnabled=false
local SpeedConnection=nil

local function setupSpeed()
if SpeedConnection then
SpeedConnection:Disconnect()
SpeedConnection=nil
end
if SpeedEnabled then
SpeedConnection=RunService.Heartbeat:Connect(function()
pcall(function()
local char=LP.Character
if char and char:FindFirstChild("Humanoid")then
local humanoid=char.Humanoid
if humanoid.MoveDirection.Magnitude>0 then
char:TranslateBy(humanoid.MoveDirection*SpeedValue/2)
end
end
end)
end)
end
end

makeToggleWithSlider("main","快速跑步速度",1,500,16,
function(v)
SpeedValue=v
setStatus("✓ 速度 "..v,true)
end,
function()
SpeedValue=16
setStatus("速度恢复",true)
end)

makeToggle("main","开启快速跑步",function()
SpeedEnabled=true
setupSpeed()
setStatus("✓ 快速跑步开启",true)
end,function()
SpeedEnabled=false
setupSpeed()
setStatus("快速跑步关闭",true)
end)

-- ==========================================
-- 视觉功能
-- ==========================================
addLabel("visual","· 视觉功能")

local NightVisionEnabled=false
local originalBrightness=1
local originalAmbient=Color3.new(0,0,0)

makeToggle("visual","夜视",function()
NightVisionEnabled=true
originalBrightness=Lighting.Brightness
originalAmbient=Lighting.Ambient
Lighting.Brightness=2
Lighting.Ambient=Color3.fromRGB(200,200,200)
Lighting.OutdoorAmbient=Color3.fromRGB(200,200,200)
setStatus("✓ 夜视开启",true)
end,function()
NightVisionEnabled=false
Lighting.Brightness=originalBrightness
Lighting.Ambient=originalAmbient
Lighting.OutdoorAmbient=Color3.fromRGB(0.5,0.5,0.5)
setStatus("夜视关闭",true)
end)

-- ==========================================
-- 二、自瞄区
-- ==========================================
addLabel("aim","· 自瞄")

makeButton("aim","加载自瞄脚本",function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/自瞄"))()
end)
setStatus("✓ 自瞄已加载",true)
end)

-- ==========================================
-- 三、战斗区
-- ==========================================
addLabel("combat","· 战斗功能")

-- 子弹追踪
local originalFire=nil
makeToggle("combat","子弹追踪",function()
local ok,bullet_handler=pcall(function()
return require(RS.ModuleScripts.GunModules.BulletHandler)
end)
if not ok then
setStatus("✗ 无法加载 BulletHandler",false)
return
end
if not originalFire then
originalFire=bullet_handler.Fire
end
local function get_closest_target(range)
local local_player=LP
local camera=Workspace.CurrentCamera
local closest_part,closest_distance=nil,range
for _,plr in ipairs(Players:GetPlayers())do
if plr~=local_player then
local character=plr.Character
if character then
local humanoid=character:FindFirstChild("Humanoid")
local head=character:FindFirstChild("Head")
if head and humanoid and humanoid.Health>0 then
local screen_position,on_screen=camera:WorldToViewportPoint(head.Position)
if on_screen then
local distance=(Vector2.new(screen_position.X,screen_position.Y)-camera.ViewportSize/2).Magnitude
if distance<closest_distance then
closest_part=head
closest_distance=distance
end
end
end
end
end
end
return closest_part
end
bullet_handler.Fire=function(data)
local closest=get_closest_target(999)
if closest then
data.Force=data.Force*1000
data.Direction=(closest.Position-data.Origin).Unit
end
return originalFire(data)
end
setStatus("✓ 子弹追踪开启",true)
end,function()
if originalFire then
local ok,bullet_handler=pcall(function()
return require(RS.ModuleScripts.GunModules.BulletHandler)
end)
if ok then
bullet_handler.Fire=originalFire
end
end
setStatus("子弹追踪关闭",true)
end)

-- 自动加入对战
local autoLobbyEnabled=false
local autoLobbyThread=nil
makeToggle("combat","自动加入对战",function()
autoLobbyEnabled=true
if not autoLobbyThread then
autoLobbyThread=coroutine.wrap(function()
while autoLobbyEnabled do
task.wait()
local ok,viewModel=pcall(function()
return Workspace:FindFirstChild("ViewModel")
end)
if ok and viewModel==nil then
pcall(function()
RS.Remotes.Command:FireServer("Lobby")
task.wait(0.35)
RS.Remotes.Command:FireServer("Play")
end)
task.wait(0.35)
end
end
autoLobbyThread=nil
end)
autoLobbyThread()
end
setStatus("✓ 自动加入对战开启",true)
end,function()
autoLobbyEnabled=false
autoLobbyThread=nil
setStatus("自动加入对战关闭",true)
end)

-- 狂暴连杀
local ragebotConnection=nil
local currentTarget=nil
local lastShotTime=0

local function isDead(plr)
if not plr or not plr.Character then return true end
local humanoid=plr.Character:FindFirstChild("Humanoid")
return not humanoid or humanoid.Health<=0
end

local function getVisiblePart(targetCharacter)
if not targetCharacter or not LP.Character then return nil end
local localCharacter=LP.Character
local humanoidRootPart=localCharacter:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return nil end
local partNames={"Head","UpperTorso","Torso","LowerTorso","HumanoidRootPart"}
local bestPart=nil
local bestPosition=nil
local bestOrigin=nil
local minDistance=math.huge
for _,partName in ipairs(partNames)do
local part=targetCharacter:FindFirstChild(partName)
if part and part:IsA("BasePart")then
local targetPosition=part.Position
for height=0,10.5,2 do
local startPos=humanoidRootPart.Position+Vector3.new(0,height,0)
local direction=(targetPosition-startPos).Unit
local forwardPos=startPos+direction*2.5
local rayParams=RaycastParams.new()
rayParams.FilterType=Enum.RaycastFilterType.Exclude
rayParams.FilterDescendantsInstances={localCharacter,Camera}
rayParams.IgnoreWater=true
local ray=Workspace:Raycast(forwardPos,targetPosition-forwardPos,rayParams)
if not ray or ray.Instance:IsDescendantOf(targetCharacter)or ray.Instance.Transparency>=0.9 then
local distance=(targetPosition-forwardPos).Magnitude
if distance<minDistance then
minDistance=distance
bestPart=part
bestPosition=targetPosition
bestOrigin=forwardPos
end
end
end
end
end
return bestPart,bestPosition,bestOrigin
end

local function playShootSound()
local sound=Instance.new("Sound")
sound.SoundId="rbxassetid://6534948092"
sound.Volume=1
sound.Parent=Camera
sound.PlayOnRemove=true
sound:Destroy()
end

local function createBeam(startPos,endPos)
local part1=Instance.new("Part")
part1.Anchored=true
part1.CanCollide=false
part1.Transparency=1
part1.Size=Vector3.new(0.1,0.1,0.1)
part1.Position=startPos
part1.Parent=Workspace
local part2=Instance.new("Part")
part2.Anchored=true
part2.CanCollide=false
part2.Transparency=1
part2.Size=Vector3.new(0.1,0.1,0.1)
part2.Position=endPos
part2.Parent=Workspace
local att1=Instance.new("Attachment")
att1.Parent=part1
local att2=Instance.new("Attachment")
att2.Parent=part2
local beam1=Instance.new("Beam")
beam1.Color=ColorSequence.new(Color3.fromRGB(0,0,0))
beam1.Transparency=NumberSequence.new(0)
beam1.Width0=0.25
beam1.Width1=0.25
beam1.Texture="rbxassetid://7136858729"
beam1.TextureSpeed=0.8
beam1.TextureMode=Enum.TextureMode.Wrap
beam1.Brightness=1
beam1.LightEmission=0
beam1.FaceCamera=true
beam1.Attachment0=att1
beam1.Attachment1=att2
beam1.Parent=part1
local beam2=Instance.new("Beam")
beam2.Color=ColorSequence.new(Color3.fromRGB(180,200,255))
beam2.Transparency=NumberSequence.new(0.4)
beam2.Width0=0.12
beam2.Width1=0.12
beam2.Texture="rbxassetid://7136858729"
beam2.TextureSpeed=1.2
beam2.TextureMode=Enum.TextureMode.Wrap
beam2.Brightness=1.2
beam2.LightEmission=0.6
beam2.FaceCamera=true
beam2.Attachment0=att1
beam2.Attachment1=att2
beam2.Parent=part1
local shaking=true
task.spawn(function()
while shaking and part1 and part1.Parent do
att1.Position=Vector3.new(math.random(-3,3)/100,math.random(-3,3)/100,math.random(-3,3)/100)
att2.Position=Vector3.new(math.random(-3,3)/100,math.random(-3,3)/100,math.random(-3,3)/100)
task.wait(0.02)
end
end)
task.delay(math.random(10,40)/10,function()
shaking=false
for i=0,1,0.05 do
if not part1 or not part1.Parent then break end
beam1.Transparency=NumberSequence.new(i)
beam2.Transparency=NumberSequence.new(0.4+i*0.6)
task.wait(0.03)
end
pcall(function()part1:Destroy()end)
pcall(function()part2:Destroy()end)
end)
end

local function shoot(plr,targetPart,targetPos,origin)
local currentTime=tick()
if currentTime-lastShotTime<0.56 then return false end
local character=LP.Character
if not character or not targetPart or not origin then return false end
local direction=(targetPos-origin).Unit
local time=tick()
local cframe=CFrame.lookAt(origin,targetPos)
local clientRemotes=LP:FindFirstChild("ClientRemotes")
if clientRemotes then
pcall(function()clientRemotes.CheckFire:FireServer(time,origin)end)
pcall(function()clientRemotes.CheckShot:FireServer(0,0,1,0.8,cframe,targetPos,targetPart,11,time)end)
pcall(function()clientRemotes.Reload:FireServer()end)
end
local gun=RS:FindFirstChild("ModuleScripts")
if gun then
gun=gun:FindFirstChild("GunModules")
if gun then
gun=gun:FindFirstChild("Remote")
if gun then
pcall(function()gun.ProjectileRender:FireServer(time,character,origin,direction*999999,360,0,Vector3.zero,5,"Bullet")end)
pcall(function()gun.ProjectileFinished:FireServer(time,CFrame.new(targetPos),"Gib_T",false,15,"rbxassetid://2814354338")end)
end
end
end
createBeam(origin,targetPos)
playShootSound()
lastShotTime=currentTime
return true
end

local function getVisibleTargets()
local targets={}
local character=LP.Character
if not character then return targets end
local humanoidRootPart=character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return targets end
local origin=humanoidRootPart.Position
for _,plr in ipairs(Players:GetPlayers())do
if plr~=LP and not isDead(plr)and plr.Character then
local visiblePart,visiblePos,originPos=getVisiblePart(plr.Character)
if visiblePart and visiblePos and originPos then
table.insert(targets,{
player=plr,
distance=(visiblePos-origin).Magnitude,
part=visiblePart,
position=visiblePos,
origin=originPos
})
end
end
end
table.sort(targets,function(a,b)return a.distance<b.distance end)
return targets
end

makeToggle("combat","狂暴连杀",function()
if not ragebotConnection then
ragebotConnection=RunService.Heartbeat:Connect(function()
pcall(function()
if currentTarget and not isDead(currentTarget)then
local targetChar=currentTarget.Character
if targetChar then
local visiblePart,visiblePos,origin=getVisiblePart(targetChar)
if visiblePart and visiblePos and origin then
shoot(currentTarget,visiblePart,visiblePos,origin)
else
currentTarget=nil
end
end
else
currentTarget=nil
end
if not currentTarget then
local targets=getVisibleTargets()
if #targets>0 then
currentTarget=targets[1].player
end
end
end)
end)
end
setStatus("✓ 狂暴连杀开启",true)
end,function()
if ragebotConnection then
ragebotConnection:Disconnect()
ragebotConnection=nil
end
currentTarget=nil
lastShotTime=0
setStatus("狂暴连杀关闭",true)
end)

-- ==========================================
-- 辅助提醒
-- ==========================================
addLabel("combat","· 辅助提醒")

local BackstabCheckEnabled=false
local BackstabCooldown=0
local BACKSTAB_COOLDOWN_TIME=3

makeToggle("combat","偷袭检测",function()
BackstabCheckEnabled=true
setStatus("✓ 偷袭检测开启",true)
end,function()
BackstabCheckEnabled=false
setStatus("偷袭检测关闭",true)
end)

RunService.Heartbeat:Connect(function(deltaTime)
if BackstabCooldown>0 then
BackstabCooldown=BackstabCooldown-deltaTime
end
if not BackstabCheckEnabled or BackstabCooldown>0 then return end
pcall(function()
local myCharacter=LP.Character
local myHRP=myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
if not myHRP then return end
local myPosition=myHRP.Position
local myCFrame=myHRP.CFrame
for _,plr in ipairs(Players:GetPlayers())do
if plr~=LP and plr.Character then
local hrp=plr.Character:FindFirstChild("HumanoidRootPart")
local humanoid=plr.Character:FindFirstChild("Humanoid")
if hrp and humanoid and humanoid.Health>0 then
local enemyPosition=hrp.Position
local distance=(myPosition-enemyPosition).Magnitude
if distance<30 then
local toEnemy=(enemyPosition-myPosition).Unit
local myForward=myCFrame.LookVector
local dotProduct=toEnemy:Dot(myForward)
if dotProduct<0.5 then
setStatus("⚠ "..plr.Name.." 可能偷袭",false)
BackstabCooldown=BACKSTAB_COOLDOWN_TIME
break
end
end
end
end
end
end)
end)

local DeathCheckEnabled=false

local function SetupDeathDetection()
LP.CharacterAdded:Connect(function(character)
task.wait(0.5)
pcall(function()
local humanoid=character:WaitForChild("Humanoid")
humanoid.Died:Connect(function()
if DeathCheckEnabled then
setStatus("💀 你已死亡",false)
end
end)
end)
end)
if LP.Character then
pcall(function()
local humanoid=LP.Character:FindFirstChild("Humanoid")
if humanoid then
humanoid.Died:Connect(function()
if DeathCheckEnabled then
setStatus("💀 你已死亡",false)
end
end)
end
end)
end
end

makeToggle("combat","死亡提醒",function()
DeathCheckEnabled=true
SetupDeathDetection()
setStatus("✓ 死亡提醒开启",true)
end,function()
DeathCheckEnabled=false
setStatus("死亡提醒关闭",true)
end)

-- ==========================================
-- 四、透视区
-- ==========================================
addLabel("visual","· 玩家透视")

local espEnabled=false
local espBillboards={}
local espConnections={}

local function cleanupESP(plr)
if espConnections[plr]then
for _,conn in ipairs(espConnections[plr])do
pcall(function()conn:Disconnect()end)
end
espConnections[plr]=nil
end
local char=plr.Character
if char then
pcall(function()
local hl=char:FindFirstChild("EspHighlight")
if hl then hl:Destroy()end
end)
pcall(function()
local hrp=char:FindFirstChild("HumanoidRootPart")
if hrp then
local bb=hrp:FindFirstChild("EspBillboard")
if bb then bb:Destroy()end
end
end)
end
espBillboards[plr]=nil
end

local function createESP(plr)
if plr==LP then return end
local char=plr.Character
if not char then return end
pcall(function()
local hl=char:FindFirstChild("EspHighlight")
if hl then hl:Destroy()end
end)
pcall(function()
local hrp=char:FindFirstChild("HumanoidRootPart")
if hrp then
local bb=hrp:FindFirstChild("EspBillboard")
if bb then bb:Destroy()end
end
end)
local hrp=char:FindFirstChild("HumanoidRootPart")
if not hrp then
task.spawn(function()
local success=pcall(function()char:WaitForChild("HumanoidRootPart",5)end)
if success and espEnabled and plr.Parent then
createESP(plr)
end
end)
return
end
local highlight=Instance.new("Highlight")
highlight.Name="EspHighlight"
highlight.Parent=char
highlight.FillTransparency=0.5
highlight.FillColor=Color3.fromRGB(255,255,0)
highlight.OutlineColor=Color3.fromRGB(255,255,0)
highlight.OutlineTransparency=0
highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
local billboard=Instance.new("BillboardGui")
billboard.Name="EspBillboard"
billboard.Parent=hrp
billboard.Size=UDim2.new(0,200,0,50)
billboard.StudsOffset=Vector3.new(0,3,0)
billboard.AlwaysOnTop=true
local nameLabel=Instance.new("TextLabel")
nameLabel.Name="NameLabel"
nameLabel.Parent=billboard
nameLabel.Size=UDim2.new(1,0,0.5,0)
nameLabel.BackgroundTransparency=1
nameLabel.Text=plr.Name
nameLabel.TextColor3=Color3.fromRGB(255,255,0)
nameLabel.TextStrokeTransparency=0
nameLabel.TextSize=14
nameLabel.Font=Enum.Font.SourceSansBold
local distLabel=Instance.new("TextLabel")
distLabel.Name="DistLabel"
distLabel.Parent=billboard
distLabel.Size=UDim2.new(1,0,0.5,0)
distLabel.Position=UDim2.new(0,0,0.5,0)
distLabel.BackgroundTransparency=1
distLabel.Text="0m"
distLabel.TextColor3=Color3.fromRGB(255,255,0)
distLabel.TextStrokeTransparency=0
distLabel.TextSize=12
distLabel.Font=Enum.Font.SourceSans
espBillboards[plr]=billboard
end

local function setupPlayerESP(plr)
if plr==LP then return end
if espConnections[plr]then
for _,conn in ipairs(espConnections[plr])do
pcall(function()conn:Disconnect()end)
end
end
espConnections[plr]={}
table.insert(espConnections[plr],plr.CharacterAdded:Connect(function(char)
task.spawn(function()
pcall(function()char:WaitForChild("HumanoidRootPart",5)end)
if espEnabled then
task.wait(0.1)
createESP(plr)
end
end)
end))
table.insert(espConnections[plr],plr.CharacterRemoving:Connect(function()
cleanupESP(plr)
end))
if plr.Character and espEnabled then
createESP(plr)
end
end

for _,plr in ipairs(Players:GetPlayers())do
setupPlayerESP(plr)
end

Players.PlayerAdded:Connect(function(plr)
setupPlayerESP(plr)
end)

Players.PlayerRemoving:Connect(function(plr)
cleanupESP(plr)
end)

RunService.RenderStepped:Connect(function()
if not espEnabled then return end
local myChar=LP.Character
local myPos=myChar and myChar:FindFirstChild("HumanoidRootPart")and myChar.HumanoidRootPart.Position
for plr,billboard in pairs(espBillboards)do
if plr.Parent and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")and billboard and billboard.Parent then
local distLabel=billboard:FindFirstChild("DistLabel")
if distLabel and myPos then
local dist=(plr.Character.HumanoidRootPart.Position-myPos).Magnitude
distLabel.Text=string.format("%.0fm",dist)
end
else
espBillboards[plr]=nil
end
end
end)

task.spawn(function()
while true do
task.wait(1)
if not espEnabled then continue end
for _,plr in ipairs(Players:GetPlayers())do
if plr~=LP and plr.Character then
local char=plr.Character
local hrp=char:FindFirstChild("HumanoidRootPart")
local hasHighlight=char:FindFirstChild("EspHighlight")
local hasBillboard=hrp and hrp:FindFirstChild("EspBillboard")
if not hasHighlight or not hasBillboard then
pcall(function()createESP(plr)end)
end
end
end
end
end)

makeToggle("visual","玩家透视",function()
espEnabled=true
for _,p in ipairs(Players:GetPlayers())do
if p~=LP then
setupPlayerESP(p)
end
end
setStatus("✓ 透视开启",true)
end,function()
espEnabled=false
for _,p in ipairs(Players:GetPlayers())do
cleanupESP(p)
end
setStatus("透视关闭",true)
end)

-- ==========================================
-- 五、设置区
-- ==========================================
addLabel("settings","· 脚本控制")

makeButton("settings","卸载脚本",function()
if JumpConnection then JumpConnection:Disconnect()end
if SpeedConnection then SpeedConnection:Disconnect()end
if ragebotConnection then ragebotConnection:Disconnect()end
for _,p in ipairs(Players:GetPlayers())do
cleanupESP(p)
end
Gui:Destroy()
end)

-- ============ 悬浮球拖动 ============
local dragging=false
local dragStart=nil
local startPos=nil
local moved=false

Orb.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.Touch then
dragging=true
moved=false
dragStart=input.Position
startPos=Orb.Position
input.Changed:Connect(function()
if input.UserInputState==Enum.UserInputState.End then dragging=false end
end)
end
end)

Orb.InputChanged:Connect(function(input)
if not dragging then return end
if input.UserInputType~=Enum.UserInputType.MouseMovement
and input.UserInputType~=Enum.UserInputType.Touch then return end
local d=input.Position-dragStart
moved=true
Orb.Position=UDim2.new(
startPos.X.Scale,startPos.X.Offset+d.X,
startPos.Y.Scale,startPos.Y.Offset+d.Y)
end)

Orb.MouseButton1Click:Connect(function()
if moved then moved=false return end
if P.Visible then
P.Visible=false
Orb.Text="⚡"
else
P.Visible=true
Orb.Text="×"
end
end)

-- 加载提示
game:GetService("StarterGui"):SetCore("SendNotification",{
Title="闪光",
Text="已加载 · 点击⚡打开",
Duration=3})