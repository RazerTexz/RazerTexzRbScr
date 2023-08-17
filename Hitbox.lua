local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService") 

local hitboxSize = 20
local teamCheck = false
local hitboxSizeVector = Vector3.new(hitboxSize, hitboxSize, hitboxSize)

if teamCheck then
    runService.Stepped:Connect(function()
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Team ~= localPlayer.Team then
                pcall(local function()
                v.Character.HumanoidRootPart.Size = hitboxSizeVector
                v.Character.HumanoidRootPart.Transparency = 0.7
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end)
            end
        end
    end)
else
    runService.Stepped:Connect(function()
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer then
                pcall(local function()
                v.Character.HumanoidRootPart.Size = hitboxSizeVector
                v.Character.HumanoidRootPart.Transparency = 0.7
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end)
            end
        end
    end) 
end