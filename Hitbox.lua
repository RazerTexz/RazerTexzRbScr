local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local teamCheck = false
local disableOnDeath = false
local hitboxSize = 20
local delay = 1
local transparency = 0.7

coroutine.wrap(function()
    while task.wait(delay) do
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local isDead = disableOnDeath and v.Character.Humanoid.Health < 1
                if (teamCheck and v.Team ~= localPlayer.Team or not teamCheck) and (not disableOnDeath or (disableOnDeath and not isDead)) then
                    local humanoidRootPart = v.Character.HumanoidRootPart
                    humanoidRootPart.Size = isDead and Vector3.new(0, 0, 0) or Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                    humanoidRootPart.Transparency = transparency
                    humanoidRootPart.BrickColor = BrickColor.new("Really black")
                    humanoidRootPart.Material = "Neon"
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)()