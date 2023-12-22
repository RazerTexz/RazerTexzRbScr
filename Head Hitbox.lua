local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local teamCheck = false
local disableOnDeath = false
local headHitboxSize = 6 -- RECOMMENDED SIZE
local delay = 1
local transparency = 0.7

local elapsedTime = 0
runService.Heartbeat:Connect(function(dt)
    elapsedTime += dt
    if elapsedTime >= delay then
        elapsedTime = 0
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                if not teamCheck or v.Team ~= localPlayer.Team then
                    local head = v.Character.Head
                    if disableOnDeath and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
                        head.Size = Vector3.new(0, 0, 0)
                    else
                        head.Size = Vector3.new(headHitboxSize, headHitboxSize, headHitboxSize)
                    end
                    head.Transparency = transparency
                    head.CanCollide = false
                end
            end
        end
    end
end)