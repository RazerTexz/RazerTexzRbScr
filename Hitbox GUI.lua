local vector3New = Vector3.new

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService").Heartbeat

local runServiceCon
local teamCheck = false
local hitboxEnabled = false
local headHitboxEnabled = false
local delay = 1
local transparency = 0.7
local hitboxSizeVec = vector3New(20, 20, 20)
local headHitboxSizeVec = vector3New(6, 6, 6)

local function applyHitbox()
    if not hitboxEnabled then return end
    for _, v in players:GetPlayers() do
        if v ~= localPlayer and not teamCheck or v.Team ~= localPlayer.Team and v.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = v.Character.HumanoidRootPart
            hrp.Size = hitboxSizeVec
            hrp.Transparency = transparency
            hrp.BrickColor = BrickColor.new("Really black")
            hrp.Material = "Neon"
            hrp.CanCollide = false
        end
    end
end
local function applyHeadHitbox()
    if not headHitboxEnabled then return end
    for _, v in players:GetPlayers() do
        if v ~= localPlayer and not teamCheck or v.Team ~= localPlayer.Team and v.Character:FindFirstChild("Head") then
            local head = v.Character.Head
            head.Size = headHitboxSizeVec
            head.Transparency = transparency
            head.CanCollide = false
        end
    end
end

local drRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/DrRay%20UI%20Library%20Modded%20By%20RazerTexz.lua"))()
local window = drRayLibrary:Load("Hitbox")
local mainTab = drRayLibrary.newTab("Main")
local settingsTab = drRayLibrary.newTab("Settings")

mainTab.newButton("Destroy GUI", "", function()
    if runServiceCon then
        runServiceCon:Disconnect()
        runServiceCon = nil
    end
    window:Destroy()
end)
mainTab.newToggle("Enable Team Check", "", false, function(state) teamCheck = state end)
mainTab.newToggle("Enable Hitbox", "", false, function(state)
    hitboxEnabled = state
    if state then applyHitbox() end
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
    elseif not hitboxEnabled and not headHitboxEnabled then
        runServiceCon:Disconnect()
        runServiceCon = nil
    end
end)
mainTab.newToggle("Enable Head Hitbox", "", false, function(state)
    headHitboxEnabled = state
    if state then applyHeadHitbox() end
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
    elseif not hitboxEnabled and not headHitboxEnabled then
        runServiceCon:Disconnect()
        runServiceCon = nil
    end
end)
settingsTab.newInput("Hitbox Size", "Default hitbox size: 20", function(size) hitboxSizeVec = vector3New(tonumber(size), tonumber(size), tonumber(size)) end)
settingsTab.newInput("Head Hitbox Size", "Default head hitbox size: 6", function(size) headHitboxSizeVec = vector3New(tonumber(size), tonumber(size), tonumber(size)) end)
settingsTab.newInput("Delay before changing hitbox", "Default delay: 1 (sec)", function(num) delay = tonumber(num) end)
settingsTab.newInput("Hitbox transparency", "Default transparency: 0.7 ", function(num) transparency = tonumber(num) end)