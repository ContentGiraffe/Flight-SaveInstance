-------------------------
-- Flight SaveInstance --
-------------------------


--// Settings

local Nil_Instances = true  -- Enable if your cheat supports getreg() and/or getnilinstances()
local Decompiler    = false -- Enable if your cheat has a LuaU decompiler


--// Services

local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')
local Lighting = game:GetService('Lighting')
local ReplicatedFirst = game:GetService('ReplicatedFirst')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ServerStorage = game:GetService('ServerStorage')
local ServerScriptService = game:GetService('ServerScriptService')


--// Variables

local status
local data_pre = game:HttpGet("https://raw.githubusercontent.com/ContentGiraffe/Flight-SaveInstance/main/data_pre")
local data_post = game:HttpGet("https://raw.githubusercontent.com/ContentGiraffe/Flight-SaveInstance/main/data_post")


--// Functions

local function TypeWriter(vstring, ustring)
	local orig = ustring
	local length = string.len(orig)
	
	vstring.Text = ''
	for i=1, length do
		vstring.Text = vstring.Text .. orig:sub(i,i)
		wait()
	end
end

status = data_pre

local function SaveParts()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA('Part') then
            status = status .. '<Item class="Part" referent="RBX710AC1343707480B90EC2367494DCDF2"><Properties><bool name="Anchored">'..tostring(part.Anchored)..'</bool><BinaryString name="AttributesSerialize"></BinaryString><bool name="CanCollide">'..tostring(part.CanCollide)..'</bool><bool name="CastShadow">'..tostring(part.CastShadow)..'</bool><int name="CollisionGroupId">0</int><string name="Name">'..tostring(part.Name)..'</string><float name="Reflectance">'..tostring(part.Reflectance)..'</float><BinaryString name="Tags"></BinaryString><float name="Transparency">'..tostring(part.Transparency)..'</float><Vector3 name="size"> <X>'..tostring(part.Size.X)..'</X> <Y>'..tostring(part.Size.Y)..'</Y> <Z>'..tostring(part.Size.Z)..'</Z> </Vector3><Color3 name="Color"><R>'..tostring(part.Color.R)..'</R><G>'..tostring(part.Color.G)..'</G><B>'..tostring(part.Color.B)..'</B></Color3><Vector3 name="Position"><X>'..part.Position.X..'</X><Y>'..part.Position.Y..'</Y><Z>'..part.Position.Z..'</Z></Vector3><Vector3 name="Orientation"><X>'..part.Orientation.X..'</X><Y>'..part.Orientation.Y..'</Y><Z>'..part.Orientation.Z..'</Z></Vector3></Properties></Item>'
        end
    end
end


--// SaveInstance

getgenv().saveinstance = function(nilinstances, luadec)
    local a=Instance.new("ScreenGui")local b=Instance.new("Frame")local c=Instance.new("TextLabel")a.Name="SaveInstance Gui"a.ResetOnSpawn=true;a.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui")a.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(255,255,255)b.BackgroundTransparency=1.000;b.BorderSizePixel=0;b.Position=UDim2.new(0.2362739,0,0,0)b.Size=UDim2.new(0.526835263,0,0.239557743,0)c.Parent=b;c.BackgroundColor3=Color3.fromRGB(255,255,255)c.BackgroundTransparency=1.000;c.Position=UDim2.new(0,0,0.200000003,0)c.Size=UDim2.new(1,0,0.2871795,0)c.Font=Enum.Font.SourceSansBold;c.Text="Flight SaveInstance loaded"c.TextColor3=Color3.fromRGB(255,255,255)c.TextScaled=true;c.TextSize=14.000;c.TextStrokeTransparency=-2.000;c.TextWrapped=true
    TypeWriter(c, 'Flight SaveInstance has loaded!')
    wait(1)
    TypeWriter(c, 'Saving Parts...')
    SaveParts()
    TypeWriter(c, 'Writing file...')
    writefile('Flight_'..game.PlaceId..".rbxlx", status .. data_post)
    TypeWriter(c, 'Flight SaveInstance has completed!')
    c.Text = ''
end
