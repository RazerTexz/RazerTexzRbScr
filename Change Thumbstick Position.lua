local thumbstickFrame = game:GetService("Players").LocalPlayer.PlayerGui.TouchGui.TouchControlFrame.ThumbstickFrame
local pos = UDim2.fromScale(0.09, 0.68)
thumbstickFrame:GetPropertyChangedSignal("Position"):Connect(function() thumbstickFrame.Position = pos end)