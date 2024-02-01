local vector3New = Vector3.new
local brickColorNew = BrickColor.new

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService").Heartbeat

local runServiceCon = nil
local teamCheck = false
local hitboxEnabled = false
local headHitboxEnabled = false
local disableOnDeath = false
local delay = 1
local transparency = 0.7
local hitboxSizeVec = vector3New(20, 20, 20)
local headHitboxSizeVec = vector3New(6, 6, 6)
local noHitbox = vector3New(0, 0, 0)
local color = brickColorNew("Really black")

local drRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/DrRay%20UI%20Library%20Modded%20By%20RazerTexz.lua"))()
local window = drRayLibrary:Load("Hitbox", "Default")
local mainTab = drRayLibrary.newTab("Main", "")
local settingsTab = drRayLibrary.newTab("Settings", "")

mainTab.newButton("Destroy GUI", "", function() window:Destroy() end)
mainTab.newToggle("Enable Team Check", "", false, function(state) teamCheck = state end)
mainTab.newToggle("Enable Hitbox", "", false, function(state)
    hitboxEnabled = state
    if not runServiceCon then
        local elapsedTime = 0
        runServiceCon = runService:Connect(function(dt)
            elapsedTime += dt
            if elapsedTime >= delay then
                elapsedTime = 0
                applyHitbox()
                applyHeadHitbox()
            end
        end)
    elseif not hitboxEnabled and headHitboxEnabled then
        runServiceCon:Disconnect()
        runServiceCon = nil
    end
end)
mainTab.newToggle("Enable Head Hitbox", "", false, function(state)
    headHitboxEnabled = state
    if not runServiceCon then
        local elapsedTime = 0
        runServiceCon = runService:Connect(function(dt)
            elapsedTime += dt
            if elapsedTime >= delay then
                elapsedTime = 0
                applyHitbox()
                applyHeadHitbox()
            end
        end)
    elseif not hitboxEnabled and headHitboxEnabled then
        runServiceCon:Disconnect()
        runServiceCon = nil
    end
end)
mainTab.newToggle("Disable On Death", "", false, function(state) disableOnDeath = state end)
settingsTab.newInput("Hitbox Size", "Default hitbox size: 20", function(size) hitboxSizeVec = Vector3.new(tonumber(size), tonumber(size), tonumber(size)) end)
settingsTab.newInput("Head Hitbox Size", "Default head hitbox size: 6", function(size) headHitboxSizeVec = Vector3.new(tonumber(size), tonumber(size), tonumber(size)) end)
settingsTab.newInput("Delay before changing hitbox", "Default delay: 1 (sec)", function(num) delay = tonumber(num) end)
settingsTab.newInput("Hitbox transparency", "Default transparency: 0.7 ", function(num) transparency = tonumber(num) end)
local function applyHitbox()
    if not hitboxEnabled then return end
    for _, v in players:GetPlayers() do
        if v ~= localPlayer and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
            if not teamCheck or v.Team ~= localPlayer.Team then
                if disableOnDeath and v.Character.Humanoid.Health <= 0 then
                    v.Character.HumanoidRootPart.Size = noHitbox
                else
                    v.Character.HumanoidRootPart.Size = hitboxSizeVec
                end
                v.Character.HumanoidRootPart.Transparency = transparency
                v.Character.HumanoidRootPart.BrickColor = color
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end
        end
    end
end
local function applyHeadHitbox()
    if not headHitboxEnabled then return end
    for _, v in players:GetPlayers() do
        if v ~= localPlayer and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") then
            if not teamCheck or v.Team ~= localPlayer.Team then
                if disableOnDeath and v.Character.Humanoid.Health <= 0 then
                    v.Character.Head.Size = noHitbox
                else
                    v.Character.Head.Size = headHitboxSizeVec
                end
                v.Character.Head.Transparency = transparency
                v.Character.Head.CanCollide = false
            end
        end
    end
end