local runService = game:GetService("RunService").Heartbeat
local thumbstickFrame = game:GetService("Players").LocalPlayer.PlayerGui.TouchGui.TouchControlFrame.ThumbstickFrame
local udim2FromScale = UDim2.fromScale
local scale = udim2FromScale(0.09, 0.68)

runService:Connect(function()
    thumbstickFrame.Position = scale
end)