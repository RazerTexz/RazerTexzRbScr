local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService")
local thumbstickFrame = localPlayer.PlayerGui.TouchGui.TouchControlFrame:FindFirstChild("ThumbstickFrame")

runService.Stepped:Connect(function()
    thumbstickFrame.Position = UDim2.fromScale(0.09, 0.68)
end)