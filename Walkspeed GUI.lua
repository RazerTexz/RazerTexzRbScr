local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/DrRay%20UI%20Library%20Modded%20By%20RazerTexz.lua"))()
local window = DrRayLibrary:Load("Walkspeed GUI", "Default")
local mainTab = DrRayLibrary.newTab("Main", "")

local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local starterGui = game:GetService("StarterGui")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local character = players.LocalPlayer.Character
local mathHuge = math.huge
local physicalPropertiesNew = PhysicalProperties.new

local walkSpeed
local isWalkSpeed

local currentWalkspeed = mainTab.newLabel("Current Walkspeed: "..localPlayer.Character.Humanoid.WalkSpeed)

mainTab.newButton("Destroy GUI", "", function() window:Destroy() end)
mainTab.newInput("Custom walkspeed", "", function(speed) walkSpeed = tonumber(speed) end)
mainTab.newToggle("Apply custom walkspeed", "", false, function(state) isWalkSpeed = state end)
mainTab.newToggle("Fix sliding at high speed", "", false, function(state)
    if state then
        if localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties ~= nil then
            local playerProperties = character.HumanoidRootPart.CustomPhysicalProperties
            local a, b, c, d = playerProperties.Friction, playerProperties.Elasticity, playerProperties.FrictionWeight, playerProperties.ElasticityWeight
            playerProperties = physicalPropertiesNew(mathHuge, a, b, c, d)
        elseif character.HumanoidRootPart.CustomPhysicalProperties == nil then    
            character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(mathHuge, 0, 0)    
        end
    end
end)
local cframe = character:FindFirstChild("HumanoidRootPart").CFrame
mainTab.newButton("Refresh player", "", function()
    local refreshPosition = cframe
    character:BreakJoints()
    workspace:WaitForChild(LP.Name)
    cframe = refreshPosition
end)

local ws = character.Humanoid.WalkSpeed
runService.Heartbeat:Connect(function()
    if isWalkSpeed then 
        ws = walkSpeed
        currentWalkspeed.updateLabel("Current Walkspeed: "..localPlayer.Character.Humanoid.WalkSpeed)
    end
end)