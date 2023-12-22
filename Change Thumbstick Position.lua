local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService").Heartbeat
local thumbstickFrame = localPlayer.PlayerGui.TouchGui.TouchControlFrame:FindFirstChild("ThumbstickFrame")
local udim2FromScale = UDim2.fromScale
local scale = udim2FromScale(0.09, 0.68)

runService:Connect(function()
    thumbstickFrame.Position = scale
end)