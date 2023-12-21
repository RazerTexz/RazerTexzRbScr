local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local teamCheck = false
local hitboxEnabled = false
local headHitboxEnabled = false
local disableOnDeath = false
local hitboxSize = 20
local headHitboxSize = 6
local delay = 1
local transparency = 0.7

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/DrRay%20UI%20Library%20Modded%20By%20RazerTexz.lua"))()
local window = DrRayLibrary:Load("Hitbox", "Default")
local mainTab = DrRayLibrary.newTab("Main", "")
local settingsTab = DrRayLibrary.newTab("Settings", "")

mainTab.newButton("Destroy GUI", "", function() game:GetService("CoreGui"):FindFirstChild("DrRay"):Destroy() end)
mainTab.newToggle("Enable Team Check", "", false, function(state) teamCheck = state end)
mainTab.newToggle("Enable Hitbox", "", false, function(state) hitboxEnabled = state end)
mainTab.newToggle("Enable Head Hitbox", "", false, function(state) headHitboxEnabled = state end)
mainTab.newToggle("Disable On Death", "", false, function(state) disableOnDeathEnabled = state end)

settingsTab.newInput("Hitbox Size", "Default hitbox size: 20", function(size) hitboxSize = tonumber(size) end)
settingsTab.newInput("Head Hitbox Size", "Default head hitbox size: 6", function(size) headHitboxSize = tonumber(size) end)
settingsTab.newInput("Delay before changing hitbox", "Default delay: 1 (sec)", function(num) delay = tonumber(num) end)
settingsTab.newInput("Hitbox transparency", "Default transparency: 0.7 ", function(num) transparency = tonumber(num) end)

local function applyHitbox()
    if not hitboxEnabled then
        return
    end
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            if not teamCheck or teamCheck and v.Team ~= localPlayer.Team then
                local humanoidRootPart = v.Character.HumanoidRootPart
                humanoidRootPart.Size = (disableOnDeath and v.Character.Humanoid.Health < 1) and Vector3.new(0, 0, 0) or Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                humanoidRootPart.Transparency = transparency
                humanoidRootPart.BrickColor = BrickColor.new("Really black")
                humanoidRootPart.Material = "Neon"
                humanoidRootPart.CanCollide = false
            end
        end
    end
end
local function applyHeadHitbox()
    if not headHitboxEnabled then
        return
    end
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
            if not teamCheck or teamCheck and v.Team ~= localPlayer.Team then
                local head = v.Character.Head
                head.Size = (disableOnDeath and v.Character.Humanoid.Health < 1) and Vector3.new(0, 0, 0) or Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)
                head.Transparency = transparency
                head.CanCollide = false
            end
        end
    end
end

coroutine.wrap(function()
    while task.wait(delay) do
        applyHitbox()
        applyHeadHitbox()
    end
end)()