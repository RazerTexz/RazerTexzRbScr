local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Kavo%20UI%20Draggable%20Android.lua"))()
local Window = Library.CreateLib("Walkspeed Gui", "Ocean")

local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local MainTab = Window:NewTab("Main")
local MainSec = MainTab:NewSection("--- MAIN TAB ---")
local customWalkSpeedCounter = MainSec:NewLabel("Custom walkspeed counter: nil")
local currentWalkSpeed = MainSec:NewLabel("Current walkspeed: nil")
local walkSpeed
getgenv().isWalkSpeed

MainSec:NewTextBox("Custom walkspeed", "", function(speed)
    walkSpeed = tonumber(speed)
    customWalkSpeedCounter:UpdateLabel("Custom walkspeed counter: "..tonumber(speed))
end)
MainSec:NewToggle("Apply custom walkspeed", "", function(bool)
    getgenv().isWalkSpeed = bool
end)
MainSec:NewToggle("Fix sliding at high speed", "", function(bool)
    if bool then
        if localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties ~= nil then
            local playerProperties = localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties
            local a, b, c, d = playerProperties.Friction, playerProperties.Elasticity, playerProperties.FrictionWeight, playerProperties.ElasticityWeight
            playerProperties = PhysicalProperties.new(math.huge, a, b, c, d)
        elseif localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties == nil then    
            localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0, 0)    
        end
    end
end)
MainSec:NewButton("Refresh player", "", function()
    local refreshPosition = localPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
    localPlayer.Character:BreakJoints()
    workspace:WaitForChild(LP.Name)
    localPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = refreshPosition
end)

runService.Heartbeat:Connect(function()
    currentWalkSpeed:UpdateLabel("Current walkspeed: "..localPlayer.Character.Humanoid.WalkSpeed)
    if isWalkSpeed then
        localPlayer.Character.Humanoid.WalkSpeed = walkSpeed
    end
end)

local InfoTab = Window:NewTab("Info")
local InfoSec = InfoTab:NewSection("--- INFO TAB---")
InfoSec:NewLabel("Made By RazerTexz")
