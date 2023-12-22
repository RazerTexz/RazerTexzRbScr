local players = game:GetService("Players")
local getPlayers = players.GetPlayers
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService").Heartbeat
local vector3New = Vector3.new

local teamCheck = false
local disableOnDeath = false
local headHitboxSize = 6 -- RECOMMENDED SIZE
local delay = 1
local transparency = 0.7
local headHitboxSizeVec = vector3New(headHitboxSize, headHitboxSize, headHitboxSize)
local noHitbox = vector3New(0, 0, 0)

local elapsedTime = 0
runService:Connect(function(dt)
    elapsedTime += dt
    if elapsedTime >= delay then
        elapsedTime = 0
        for _, v in getPlayers() do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                if not teamCheck or v.Team ~= localPlayer.Team then
                    local head = v.Character.Head
                    if disableOnDeath and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
                        head.Size = noHitbox
                    else
                        head.Size = headHitboxSizeVec
                    end
                    head.Transparency = transparency
                    head.CanCollide = false
                end
            end
        end
    end
end)