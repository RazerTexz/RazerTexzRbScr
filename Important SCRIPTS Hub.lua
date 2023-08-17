-- Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RobloxScripts/main/Kavo%20UI%20Draggable%20Android.lua?token=GHSAT0AAAAAACGNMMWVOASIOPXUG5BI6MS6ZG6DKMQ"))()
local Window = Library.CreateLib("Important SCRIPTS Hub", "Ocean")

-- Main
local MainTab = Window:NewTab("Main")
local MainSec = MainTab:NewSection("Main Section")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService")

getgenv().thumbstick = false

local thumbstickFrame = localPlayer.PlayerGui.TouchGui.TouchControlFrame:FindFirstChild("ThumbstickFrame")
local jumpButton = localPlayer.PlayerGui.TouchGui.TouchControlFrame:FindFirstChild("JumpButton")

MainSec:NewButton("Infinite Yield", "", function()
 
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
MainSec:NewButton("Turtle Spy", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BDhSQqUU", true))()
end)
MainSec:NewButton("Android Keyboard", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/xSsDaMg2"))()
end)
MainSec:NewButton("Fly GUI V3", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/gNb0mYab"))()
end)
MainSec:NewButton("P-Shade GUI", "", function()
    loadstring(game:HttpGet(("https://pastefy.app/xXkUxA0P/raw"),true))()
end)
MainSec:NewButton("Change Thumbstick Position", "", function()
    thumbstick = not thumbstick
end)
MainSec:NewButton("Change Jump Button Position", "", function()
    jumpButton.Position = UDim2.fromScale(0.87, 0.72)
end)
MainSec:NewDropdown("Touch Movement Mode", "", {"UserChoice", "Thumbstick", "DPad", "Thumbpad", "Scriptable", "DynamicThumbstick"}, function(option)
	localPlayer.DevTouchMovementMode = Enum.DevTouchMovementMode[option]
end)

runService.Stepped:Connect(function()
    if thumbstick then
        thumbstickFrame.Position = UDim2.fromScale(0.09, 0.68)
    end
end)
