local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local teamCheck = false
local disableOnDeath = false
local headHitboxSize = 6 -- RECOMMENDED SIZE
local delay = 1
local headHitboxSizeVec = Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)
local noHitbox = Vector3.new(0, 0, 0)

local elapsedTime = 0
game:GetService("RunService").Heartbeat:Connect(function(dt)
    elapsedTime += dt
    if elapsedTime >= delay then
        elapsedTime = 0
        for _, v in players:GetPlayers() do
            if v ~= localPlayer and not teamCheck or v.Team ~= localPlayer.Team then
                v.Character.Head.Size = if (disableOnDeath and v.Character.Humanoid.Health <= 0) then noHitbox else headHitboxSizeVec
                v.Character.Head.Transparency = 0.7
                v.Character.Head.CanCollide = false
            end
        end
    end
end)