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
                if not teamCheck or teamCheck and v.Team ~= localPlayer.Team then
                    local humanoidRootPart = v.Character.HumanoidRootPart
                    if disableOnDeath and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
                        humanoidRootPart.Size = Vector3.new(0, 0, 0)
                    else
                        humanoidRootPart.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                    end
                    humanoidRootPart.Transparency = transparency
                    humanoidRootPart.BrickColor = BrickColor.new("Really black")
                    humanoidRootPart.Material = "Neon"
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)()