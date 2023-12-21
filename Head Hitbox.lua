local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local teamCheck = false
local disableOnDeath = false
local headHitboxSize = 6 -- RECOMMENDED SIZE
local delay = 1
local transparency = 0.7

coroutine.wrap(function()
    while task.wait(delay) do
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                if not teamCheck or teamCheck and v.Team ~= localPlayer.Team then
                    local head = v.Character.Head
                    head.Size = (disableOnDeath and v.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead) and Vector3.new(0, 0, 0) or Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)
                    head.Transparency = transparency
                    head.CanCollide = false
                end
            end
        end
    end
end)()