local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local teamCheck
local hitboxEnabled
local hitboxSize = 20
local headHitboxEnabled
local headHitboxSize = 6
local delay = 1
local transparency = 0.7
local hitboxSizeVec = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
local headHitboxSizeVec = Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/DrRay%20UI%20Library%20Modded%20By%20RazerTexz.lua"))()
local window = DrRayLibrary:Load("Hitbox", "Default")
local mainTab = DrRayLibrary.newTab("Main", "")

mainTab.newButton("Destroy GUI", "", function() game:GetService("CoreGui"):FindFirstChild("DrRay"):Destroy() end)
mainTab.newToggle("Enable Team Check", "", false, function(state) hitboxEnabled = state end)
mainTab.newToggle("Enable Hitbox", "", false, function(state) hitboxEnabled = state end)
mainTab.newInput("Hitbox Size", "Default hitbox size: 20", function(size) 
    hitboxSize = tonumber(size)
    hitboxSizeVec = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
end)
mainTab.newToggle("Enable Head Hitbox", "", false, function(state) headHitboxEnabled = state end)
mainTab.newInput("Head Hitbox Size", "Default head hitbox size: 6", function(size) 
    headHitboxSize = tonumber(size)
    headHitboxSizeVec = Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)
end)
mainTab.newInput("Delay before changing hitbox", "Default delay: 1 (sec)", function(num) delay = tonumber(num) end)
mainTab.newInput("Hitbox transparency", "Default transparency: 0.7 ", function(num) transparency = tonumber(num) end)

local infoTab = DrRayLibrary.newTab("Info", "")
infoTab.newLabel("Made by RazerTexz")

local function applyHitbox()
    if not hitboxEnabled then
        return
    end
    if teamCheck then
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Team ~= localPlayer.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                v.Character.HumanoidRootPart.Size = hitboxSizeVec
                v.Character.HumanoidRootPart.Transparency = transparency
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end
        end
    else
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                v.Character.HumanoidRootPart.Size = hitboxSizeVec
                v.Character.HumanoidRootPart.Transparency = transparency
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end
        end
    end
end
local function applyHeadHitbox()
    if not headHitboxEnabled then
        return
    end       
    if teamCheck then
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Team ~= localPlayer.Team and v.Character and v.Character:FindFirstChild("Head") then           
                v.Character.Head.Size = headHitboxSizeVec
                v.Character.Head.Transparency = transparency
                v.Character.Head.CanCollide = false
            end
        end
    else
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then           
                v.Character.Head.Size = headHitboxSizeVec
                v.Character.Head.Transparency = transparency
                v.Character.Head.CanCollide = false
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