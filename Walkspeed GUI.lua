-- LIBRARY
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Kavo%20UI%20Draggable%20Android.lua"))()
local Window = Library.CreateLib("Walkspeed Gui", "Ocean")

-- MAIN TAB
local MainTab = Window:NewTab("Main")
local MainSec = MainTab:NewSection("--- MAIN TAB ---")
local runService = game:GetService("RunService")
local customWalkSpeedCounter = MainSec:NewLabel("Custom walkspeed counter: nil")
local currentWalkSpeed = MainSec:NewLabel("Current walkspeed: nil")
local walkSpeed
local isWalkSpeed

MainSec:NewTextBox("Custom walkspeed", "Custom walkspeed", local function(speed)
    walkSpeed = tonumber(speed)
    customWalkSpeedCounter:UpdateLabel("Custom walkspeed counter: "..tonumber(speed))
end)
MainSec:NewToggle("Apply custom walkspeed", "Apply custom walkspeed", local function(bool)
    isWalkSpeed = bool
end)
MainSec:NewToggle("Fix sliding at high speed", "Fix sliding at high speed", local function(bool)
    if bool then
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties ~= nil then
            local playerProperties = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties
            local a, b, c, d = playerProperties.Friction, playerProperties.Elasticity, playerProperties.FrictionWeight, playerProperties.ElasticityWeight
            playerProperties = PhysicalProperties.new(math.huge, a, b, c, d)
        elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties == nil then    
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0, 0)    
        end
    end
end)
MainSec:NewButton("Refresh player", "Refresh player", function()
    local LP = game:GetService("Players").LocalPlayer
    local refreshPosition = LP.Character:WaitForChild("HumanoidRootPart").CFrame
    LP.Character:BreakJoints()
    game:GetService("Workspace"):WaitForChild(LP.Name)
    LP.Character:WaitForChild("HumanoidRootPart").CFrame = refreshPosition
end)

runService.Stepped:Connect(function()
    currentWalkSpeed:UpdateLabel("Current walkspeed: "..game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed)
    if isWalkSpeed and tonumber(walkSpeed) then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
    end
end)

-- INFO TAB
local InfoTab = Window:NewTab("Info")
local InfoSec = InfoTab:NewSection("--- INFO TAB---")

InfoSec:NewLabel("Made By RazerTexz")