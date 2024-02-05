-- Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Kavo%20UI%20Draggable%20Android.lua"))()
local window = Library.CreateLib("Important SCRIPTS Hub", "Ocean")

local serverPriority = "Players"

-- Main
local mainTab = window:NewTab("Main")
local mainSec = mainTab:NewSection("Main Section", false)
local player = game:GetService("Players").LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local coreGui = game:GetService("CoreGui")

mainSec:NewButton("Better Roblox V2", "", function()  loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Better%20Roblox%20V2.lua"))() end)
mainSec:NewButton("Change Thumbstick Position", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Change%20Thumbstick%20Position.lua"))() end)
mainSec:NewButton("Change Jump Button Position", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Change%20Jump%20Button%20Position.lua"))() end)
mainSec:NewButton("Chat Spy", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Chat%20Spy.lua"))() end)
mainSec:NewButton("Chat Spy GUI", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Chat%20Spy%20GUI.lua"))() end)
mainSec:NewButton("Dark Dex V3", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Dark%20Dex%20V3.lua"))() end)
mainSec:NewButton("Dark Dex V4", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Dark%20Dex%20V4.lua"))() end)
mainSec:NewButton("Fly GUI V3", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Fly%20GUI%20V3.lua"))() end)
mainSec:NewButton("FPS Boost By Infinite Yield", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/FPS%20Boost%20By%20Infinite%20Yield.lua"))() end)
mainSec:NewButton("FPS Boost By RazerTexz", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/FPS%20Boost%20By%20RazerTexz.lua"))() end)
mainSec:NewButton("Game Viewer", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Game%20Viewer.lua"))() end)
mainSec:NewButton("Head Hitbox", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Head%20Hitbox.lua"))() end)
mainSec:NewButton("Hide GUI", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Hide%20GUI.lua"))() end)
mainSec:NewButton("Hitbox GUI", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Hitbox%20GUI.lua"))() end)
mainSec:NewButton("Hitbox", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Hitbox.lua"))() end)
mainSec:NewButton("Hydroxide Remote Spy", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Hydroxide%20Remote%20Spy.lua"))() end)
mainSec:NewButton("Infinite Yield", "", function()  loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Infinite%20Yield.lua"))() end)
mainSec:NewButton("Keyboard Script", "", function()  loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Keyboard%20Script.lua"))() end)
mainSec:NewButton("P-Shade GUI", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/P-Shade%20GUI.lua"))() end)
mainSec:NewButton("R15 Invisibility Script", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/R15%20Invisibility%20Script.lua"))() end)
mainSec:NewButton("Simple Spy Mobile", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Simple%20Spy%20Mobile.lua"))() end)
mainSec:NewButton("Turtle Spy", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Turtle%20Spy.lua"))() end)
mainSec:NewButton("Walkspeed GUI", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Walkspeed%20GUI.lua"))() end)
mainSec:NewDropdown("Server Hop Priority (Default: Lowest Players)", "", {"Lowest Ping", "Lowest Players"}, function(opt) serverPriority = (opt == "Lowest Ping") and "Ping" or "Players" end)
mainSec:NewButton("Server Hop", "", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Join%20"..serverPriority.."%20Ping%20Server.lua"))() end)

local executorTab = window:NewTab("Executor")
local executorSec = executorTab:NewSection("Executor Section", false)
executorSec:NewLabel("| Codex |")
executorSec:NewButton("Hide / show indicator", "", function()
    if not coreGui:FindFirstChild("Codex") then return end
    coreGui.Codex.gui.navbar.dragBar.indicator.Visible = not coreGui.Codex.gui.navbar.dragBar.indicator.Visible
end)

local miscTab = window:NewTab("Misc")
local miscSec = miscTab:NewSection("Misc Section", false)
local touchMovementMode = miscSec:NewLabel("[1] "..tostring(player.DevTouchMovementMode))
local graphicsMode = miscSec:NewLabel("[2] "..tostring(settings().Rendering.GraphicsMode))
local qualityLevel = miscSec:NewLabel("[3] "..tostring(settings().Rendering.QualityLevel))
local meshPartDetailLevel = miscSec:NewLabel("[4] "..tostring(settings().Rendering.MeshPartDetailLevel))
local technology = miscSec:NewLabel("[5] "..tostring(gethiddenproperty(lighting, "Technology")))

miscSec:NewDropdown("[1] Touch Movement Mode", "", {"UserChoice", "Thumbstick", "DPad", "Thumbpad", "Scriptable", "DynamicThumbstick"}, function(opt)
    player.DevTouchMovementMode = Enum.DevTouchMovementMode[opt]
    touchMovementMode:UpdateLabel("[1] "..tostring(player.DevTouchMovementMode))
end)
miscSec:NewDropdown("[2] Graphics Mode", "", {"Automatic", "Direct3D11", "OpenGL", "Metal", "Vulkan", "NoGraphics"}, function(opt)
    settings().Rendering.GraphicsMode = Enum.GraphicsMode[opt]
    graphicsMode:UpdateLabel("[2] "..tostring(settings().Rendering.GraphicsMode))
end)
miscSec:NewDropdown("[3] Quality Level", "", {"Automatic", "Level01", "Level02", "Level03", "Level04", "Level05", "Level06", "Level07", "Level08", "Level09", "Level10", "Level11", "Level12", "Level13", "Level14", "Level15", "Level16", "Level17", "Level18", "Level19", "Level20", "Level21"}, function(opt)
    settings().Rendering.QualityLevel = Enum.QualityLevel[opt]
    qualityLevel:UpdateLabel("[3] "..tostring(settings().Rendering.QualityLevel))
end)
miscSec:NewDropdown("[4] Mesh Part Detail Level", "", {"DistanceBased", "Level00", "Level01", "Level02", "Level03", "Level04"}, function(opt)
    settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel[opt]
    meshPartDetailLevel:UpdateLabel("[4] "..tostring(settings().Rendering.MeshPartDetailLevel))
end)
miscSec:NewDropdown("[5] Technology", "", {"Legacy", "Voxel", "Compatibility", "ShadowMap", "Future"}, function(opt)
    sethiddenproperty(lighting, "Technology", Enum.Technology[opt])
    technology:UpdateLabel("[5] "..tostring(gethiddenproperty(lighting, "Technology")))
end)

local instanceStreamingTab = window:NewTab("Instance Streaming")
local instanceStreamingSec = instanceStreamingTab:NewSection("Instance Streaming Section", false)
local modelStreamingBehavior = instanceStreamingSec:NewLabel("[1] "..tostring(gethiddenproperty(workspace, "ModelStreamingBehavior")))
local streamingEnabled = instanceStreamingSec:NewLabel("[2] "..tostring(workspace.StreamingEnabled))
local streamingIntegrityMode = instanceStreamingSec:NewLabel("[3] "..tostring(gethiddenproperty(workspace, "StreamingIntegrityMode")))
local streamingMinRadius = instanceStreamingSec:NewLabel("[4] "..tostring(gethiddenproperty(workspace, "StreamingMinRadius")))
local streamingTargetRadius = instanceStreamingSec:NewLabel("[5] "..tostring(gethiddenproperty(workspace, "StreamingTargetRadius")))
local streamOutBehavior = instanceStreamingSec:NewLabel("[6] "..tostring(gethiddenproperty(workspace, "StreamOutBehavior")))

instanceStreamingSec:NewDropdown("[1] Model Streaming Behavior", "", {"Default", "Legacy", "Improved"}, function(opt)
    sethiddenproperty(workspace, "ModelStreamingBehavior", Enum.ModelStreamingBehavior[opt])
    modelStreamingBehavior:UpdateLabel("[1] "..tostring(gethiddenproperty(workspace, "ModelStreamingBehavior")))
end)
instanceStreamingSec:NewToggle("[2] Streaming Enabled", "", function(state)
    workspace.StreamingEnabled = state
    streamingEnabled:UpdateLabel("[2] "..tostring(workspace.StreamingEnabled))
end)
instanceStreamingSec:NewDropdown("[3] Streaming Integrity Mode", "", {"Default", "Disabled", "MinimumRadiusPause", "PauseOutsideLoadedArea"}, function(opt)
    sethiddenproperty(workspace, "StreamingIntegrityMode", Enum.StreamingIntegrityMode[opt])
    streamingIntegrityMode:UpdateLabel("[3] "..tostring(gethiddenproperty(workspace, "StreamingIntegrityMode")))
end)
instanceStreamingSec:NewTextBox("[4] Streaming Min Radius", "", function(txt)
	if tonumber(txt) then
	    sethiddenproperty(workspace, "StreamingMinRadius", tonumber(txt))
        streamingMinRadius:UpdateLabel("[4] "..tostring(gethiddenproperty(workspace, "StreamingMinRadius")))
	end
end)
instanceStreamingSec:NewTextBox("[5] Streaming Target Radius", "", function(txt)
	if tonumber(txt) then
	    sethiddenproperty(workspace, "StreamingTargetRadius", tonumber(txt))
        streamingTargetRadius:UpdateLabel("[5] "..tostring(gethiddenproperty(workspace, "StreamingTargetRadius")))
    end
end)
instanceStreamingSec:NewDropdown("[6] Stream Out Behavior", "", {"Default", "LowMemory", "Opportunistic"}, function(opt)
    sethiddenproperty(workspace, "StreamOutBehavior", Enum.StreamOutBehavior[opt])
    streamOutBehavior:UpdateLabel("[6] "..tostring(gethiddenproperty(workspace, "StreamOutBehavior")))
end)