local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService")

local headHitboxSize = 6 -- DONT CHANGE
local teamCheck = false
local headSizeVector = Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)

if teamCheck then
    runService.Stepped:Connect(function()
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Team ~= localPlayer.Team then
                pcall(local function()
                v.Character.Head.Size = headSizeVector
                v.Character.Head.Transparency = 0.7
                v.Character.Head.CanCollide = false
            end)
            end
        end
    end)
else
    runService.Stepped:Connect(function()
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer then
                pcall(local function()
                v.Character.Head.Size = headSizeVector
                v.Character.Head.Transparency = 0.7
                v.Character.Head.CanCollide = false
            end)
            end
        end
    end)
end