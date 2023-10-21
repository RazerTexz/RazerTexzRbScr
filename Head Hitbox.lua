local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local headHitboxSize = 6 -- RECOMMENDED SIZE
local teamCheck = false
local delay = 1
local transparency = 0.7
local headSizeVec = Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)

if teamCheck then
    coroutine.wrap(function()
        while task.wait(delay) do
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= localPlayer and v.Team ~= localPlayer.Team and v.Character and v.Character:FindFirstChild("Head") then           
                    v.Character.Head.Size = headSizeVec
                    v.Character.Head.Transparency = transparency
                    v.Character.Head.CanCollide = false
                end
            end
        end
    end)()
else
    coroutine.wrap(function()
        while task.wait(delay) do
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then                    
                    v.Character.Head.Size = headSizeVec
                    v.Character.Head.Transparency = transparency
                    v.Character.Head.CanCollide = false
                end
            end
        end
    end)()
end