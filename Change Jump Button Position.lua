local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local jumpButton = localPlayer.PlayerGui.TouchGui.TouchControlFrame:FindFirstChild("JumpButton")
local udim2FromScale = UDim2.fromScale
local scale = udim2FromScale(0.87, 0.72)

jumpButton.Position = scale