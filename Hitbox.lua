local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local teamCheck = false
local disableOnDeath = false
local hitboxSize = 20
local transparency = 0.7
local hitboxSizeVec = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
local noHitbox = Vector3.new(0, 0, 0)
local color = BrickColor.new("Really black")

for _, v in players:GetPlayers() do
    if v ~= localPlayer and not teamCheck or v.Team ~= localPlayer.Team and v.Character:FindFirstChild("HumanoidRootPart") then
        if disableOnDeath then v.CharacterRemoving:Connect(function(char) char.HumanoidRootPart.Size = noHitbox end) end
        local hrp = v.Character.HumanoidRootPart
        hrp.Size = hitboxSizeVec
        hrp.Transparency = transparency
        hrp.BrickColor = color
        hrp.Material = "Neon"
        hrp.CanCollide = false
    end
end
players.PlayersAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        if not teamCheck or plr.Team ~= localPlayer.Team then
            char.HumanoidRootPart.Size = hitboxSizeVec
            char.HumanoidRootPart.Transparency = transparency
            char.HumanoidRootPart.BrickColor = color
            char.HumanoidRootPart.Material = "Neon"
            char.HumanoidRootPart.CanCollide = false
        end
    end)
    plr.CharacterRemoving:Connect(function(char)
        if disableOnDeath then char.HumanoidRootPart.Size = noHitbox end
    end)
end)