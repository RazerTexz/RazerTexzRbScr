-- Library
local function load(scriptName: string)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/" .. scriptName))()
end

local Library = load("Kavo%20UI%20Draggable%20Android.lua")
local window = Library.CreateLib("Important SCRIPTS Hub", "Ocean")

local player = game:GetService("Players").LocalPlayer
local lighting = game:GetService("Lighting")

-- Main
local mainTab = window:NewTab("Main")
local mainSec = mainTab:NewSection("Main Section", false)

mainSec:NewButton("Change Thumbstick Position", "", function() load("Change%20Thumbstick%20Position.lua") end)
mainSec:NewButton("Change Jump Button Position", "", function() load("Change%20Jump%20Button%20Position.lua") end)
mainSec:NewButton("Dark Dex V3", "", function() load("Dark%20Dex%20V3.lua") end)
mainSec:NewButton("Dark Dex V4", "", function() load("Dark%20Dex%20V4.lua") end)
mainSec:NewButton("Fly GUI V3", "", function() load("Fly%20GUI%20V3.lua") end)
mainSec:NewButton("FPS Boost By RazerTexz", "", function() load("FPS%20Boost%20By%20RazerTexz.lua") end)
mainSec:NewButton("Head Hitbox", "", function() load("Head%20Hitbox.lua") end)
mainSec:NewButton("Hitbox", "", function() load("Hitbox.lua") end)
mainSec:NewButton("Keyboard Script", "", function()  load("Keyboard%20Script.lua") end)
mainSec:NewButton("P-Shade GUI", "", function() load("P-Shade%20GUI.lua") end)
mainSec:NewButton("Simple Spy Mobile", "", function() load("Simple%20Spy%20Mobile.lua") end)
mainSec:NewButton("Turtle Spy", "", function() load("Turtle%20Spy.lua") end)
if not game:GetService("CoreGui"):FindFirstChild("Codex") then
    local serverPriority = "Players"
    mainSec:NewDropdown("Server Hop Priority (Default: Lowest Players)", "", {"Lowest Ping", "Lowest Players"}, function(opt) serverPriority = (opt == "Lowest Ping") and "Ping" or "Players" end)
    mainSec:NewButton("Server Hop", "", function() load("Join%20Lowest%20" .. serverPriority .. "%20Server.lua") end)
end

local miscTab = window:NewTab("Misc")
local miscSec = miscTab:NewSection("Misc Section", false)
local touchMovementMode = miscSec:NewLabel("[1] "..tostring(player.DevTouchMovementMode))
local graphicsMode = miscSec:NewLabel("[2] "..tostring(settings().Rendering.GraphicsMode))
local qualityLevel = miscSec:NewLabel("[3] "..tostring(settings().Rendering.QualityLevel))
local meshPartDetailLevel = miscSec:NewLabel("[4] "..tostring(settings().Rendering.MeshPartDetailLevel))
local technology = miscSec:NewLabel("[5] "..tostring(gethiddenproperty(lighting, "Technology")))

miscSec:NewDropdown("[1] Touch Movement Mode", "", {"UserChoice", "Thumbstick", "DPad", "Thumbpad", "Scriptable", "DynamicThumbstick"}, function(opt)
    player.DevTouchMovementMode = Enum.DevTouchMovementMode[opt]
    touchMovementMode:UpdateLabel("[1] " .. opt)
end)
miscSec:NewDropdown("[2] Graphics Mode", "", {"Automatic", "Direct3D11", "OpenGL", "Metal", "Vulkan", "NoGraphics"}, function(opt)
    settings().Rendering.GraphicsMode = Enum.GraphicsMode[opt]
    graphicsMode:UpdateLabel("[2] " .. opt)
end)
miscSec:NewDropdown("[3] Quality Level", "", {"Automatic", "Level01", "Level02", "Level03", "Level04", "Level05", "Level06", "Level07", "Level08", "Level09", "Level10", "Level11", "Level12", "Level13", "Level14", "Level15", "Level16", "Level17", "Level18", "Level19", "Level20", "Level21"}, function(opt)
    settings().Rendering.QualityLevel = Enum.QualityLevel[opt]
    qualityLevel:UpdateLabel("[3] " .. opt)
end)
miscSec:NewDropdown("[4] Mesh Part Detail Level", "", {"DistanceBased", "Level00", "Level01", "Level02", "Level03", "Level04"}, function(opt)
    settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel[opt]
    meshPartDetailLevel:UpdateLabel("[4] " .. opt)
end)
miscSec:NewDropdown("[5] Technology", "", {"Legacy", "Voxel", "Compatibility", "ShadowMap", "Future"}, function(opt)
    sethiddenproperty(lighting, "Technology", Enum.Technology[opt])
    technology:UpdateLabel("[5] " .. opt)
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
    modelStreamingBehavior:UpdateLabel("[1] " .. opt)
end)
instanceStreamingSec:NewToggle("[2] Streaming Enabled", "", function(state)
    workspace.StreamingEnabled = state
    streamingEnabled:UpdateLabel("[2] " .. tostring(state))
end)
instanceStreamingSec:NewDropdown("[3] Streaming Integrity Mode", "", {"Default", "Disabled", "MinimumRadiusPause", "PauseOutsideLoadedArea"}, function(opt)
    sethiddenproperty(workspace, "StreamingIntegrityMode", Enum.StreamingIntegrityMode[opt])
    streamingIntegrityMode:UpdateLabel("[3] " .. opt)
end)
instanceStreamingSec:NewTextBox("[4] Streaming Min Radius", "", function(txt)
    sethiddenproperty(workspace, "StreamingMinRadius", tonumber(txt))
    streamingMinRadius:UpdateLabel("[4] " .. tostring(tonumber(txt)))
end)
instanceStreamingSec:NewTextBox("[5] Streaming Target Radius", "", function(txt)
    sethiddenproperty(workspace, "StreamingTargetRadius", tonumber(txt))
    streamingTargetRadius:UpdateLabel("[5] " .. tostring(tonumber(txt)))
end)
instanceStreamingSec:NewDropdown("[6] Stream Out Behavior", "", {"Default", "LowMemory", "Opportunistic"}, function(opt)
    sethiddenproperty(workspace, "StreamOutBehavior", Enum.StreamOutBehavior[opt])
    streamOutBehavior:UpdateLabel("[6] " .. opt)
end)