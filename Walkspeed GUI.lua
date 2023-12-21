local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/DrRay%20UI%20Library%20Modded%20By%20RazerTexz.lua"))()
local window = DrRayLibrary:Load("Walkspeed GUI", "Default")
local mainTab = DrRayLibrary.newTab("Main", "")

local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local starterGui = game:GetService("StarterGui")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local walkSpeed
local isWalkSpeed

local currentWalkspeed = mainTab.newLabel("Current Walkspeed: "..localPlayer.Character.Humanoid.WalkSpeed)

mainTab.newButton("Destroy GUI", "", function() game:GetService("CoreGui"):FindFirstChild("DrRay"):Destroy() end)
mainTab.newInput("Custom walkspeed", "", function(speed) walkSpeed = tonumber(speed) end)
mainTab.newToggle("Apply custom walkspeed", "", false, function(state) isWalkSpeed = state end)
mainTab.newToggle("Fix sliding at high speed", "", false, function(state)
    if state then
        if localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties ~= nil then
            local playerProperties = localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties
            local a, b, c, d = playerProperties.Friction, playerProperties.Elasticity, playerProperties.FrictionWeight, playerProperties.ElasticityWeight
            playerProperties = PhysicalProperties.new(math.huge, a, b, c, d)
        elseif localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties == nil then    
            localPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0, 0)    
        end
    end
end)
mainTab.newButton("Refresh player", "", function()
    local refreshPosition = localPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
    localPlayer.Character:BreakJoints()
    workspace:WaitForChild(LP.Name)
    localPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = refreshPosition
end)

runService.Heartbeat:Connect(function()
    if isWalkSpeed then 
        localPlayer.Character.Humanoid.WalkSpeed = walkSpeed
        currentWalkspeed.updateLabel("Current Walkspeed: "..localPlayer.Character.Humanoid.WalkSpeed)
    end
end)