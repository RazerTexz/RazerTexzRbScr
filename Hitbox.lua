local vector3New = Vector3.new
local brickColorNew = BrickColor.new

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService").Heartbeat

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
end)