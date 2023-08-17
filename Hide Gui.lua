local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local coreGui = game:GetService("CoreGui")

for _, v in ipairs(coreGui:GetChildren()) do
    if v:IsA("ScreenGui") then
        v.Enabled = false
    end
end
for _, v in ipairs(playerGui:GetChildren()) do
    if v:IsA("ScreenGui") then
        v.Enabled = false
    end
end

task.wait(5)

for _, v in ipairs(coreGui:GetChildren()) do
    if v:IsA("ScreenGui") and v.Name ~= "HeadsetDisconnectedDialog" then
        v.Enabled = true
    end
end
for _, v in ipairs(playerGui:GetChildren()) do
    if v:IsA("ScreenGui") and v.Name ~= "HeadsetDisconnectedDialog" then
        v.Enabled = true
    end
end