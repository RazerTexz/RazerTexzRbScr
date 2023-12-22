local players = game:GetService("Players")
local getPlayers = players.GetPlayers
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService").Heartbeat
local vector3New = Vector3.new
local brickColorNew = BrickColor.new

local teamCheck = false
local disableOnDeath = false
local hitboxSize = 20
local delay = 1
local transparency = 0.7
local hitboxSizeVec = vector3New(hitboxSize, hitboxSize, hitboxSize)
local noHitbox = vector3New(0, 0, 0)
local color = brickColorNew("Really black")

local elapsedTime = 0
runService:Connect(function(dt)
    elapsedTime += dt
    if elapsedTime >= delay then
        elapsedTime = 0
        for _, v in getPlayers() do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                if not teamCheck or v.Team ~= localPlayer.Team then
                    local humanoidRootPart = v.Character.HumanoidRootPart
                    if disableOnDeath and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
                        humanoidRootPart.Size = noHitbox
                    else
                        humanoidRootPart.Size = hitboxSizeVec
                    end
                    humanoidRootPart.Transparency = transparency
                    humanoidRootPart.BrickColor = color
                    humanoidRootPart.Material = "Neon"
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)