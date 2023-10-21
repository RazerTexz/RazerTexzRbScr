local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local hitboxSize = 20
local teamCheck = false
local delay = 1
local transparency = 0.7
local hitboxSizeVec = Vector3.new(hitboxSize, hitboxSize, hitboxSize)

if teamCheck then
    coroutine.wrap(function()
        while task.wait(delay) do
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= localPlayer and v.Team ~= localPlayer.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    v.Character.HumanoidRootPart.Size = hitboxSizeVec
                    v.Character.HumanoidRootPart.Transparency = transparency
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                    v.Character.HumanoidRootPart.Material = "Neon"
                    v.Character.HumanoidRootPart.CanCollide = false
                end
            end
        end
    end)()
else
    coroutine.wrap(function()
        while task.wait(delay) do
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
    end)()
end