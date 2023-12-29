-- Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Kavo%20UI%20Draggable%20Android.lua"))()
local window = Library.CreateLib("Important SCRIPTS Hub", "Ocean")

-- Main
local mainTab = window:NewTab("Main")
local mainSec = mainTab:NewSection("Main Section")
local player = game:GetService("Players").LocalPlayer
local workspace = game:GetService("Workspace")

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

local miscTab = window:NewTab("Misc")
local miscSec = miscTab:NewSection("Misc Section")
local streamingEnabled = miscSec:NewLabel("[*]", tostring(workspace.StreamingEnabled))
local touchMovementMode = miscSec:NewLabel("[1]", tostring(player.DevTouchMovementMode))
local graphicsMode = miscSec:NewLabel("[2]", tostring(settings().Rendering.GraphicsMode))
local qualityLevel = miscSec:NewLabel("[3]", tostring(settings().Rendering.QualityLevel))
local meshPartDetailLevel = miscSec:NewLabel("[4]", tostring(settings().Rendering.MeshPartDetailLevel))

miscSec:NewToggle("[*] Streaming Enabled", "", function(state)
    workspace.StreamingEnabled = state
    streamingEnabled:UpdateLabel("[*]", tostring(workspace.StreamingEnabled))
end)
miscSec:NewDropdown("[1] Touch Movement Mode", "", {"UserChoice", "Thumbstick", "DPad", "Thumbpad", "Scriptable", "DynamicThumbstick"}, function(opt)
    player.DevTouchMovementMode = Enum.DevTouchMovementMode[opt]
    touchMovementMode:UpdateLabel("[1]", tostring(player.DevTouchMovementMode))
end)
miscSec:NewDropdown("[2] Graphics Mode", "", {"Automatic", "Direct3D11", "OpenGL", "Metal", "Vulkan", "NoGraphics"}, function(opt)
    settings().Rendering.GraphicsMode = Enum.GraphicsMode[opt]
    graphicsMode:UpdateLabel("[2]", tostring(settings().Rendering.GraphicsMode))
end)
miscSec:NewDropdown("[3] Quality Level", "", {"Automatic", "Level01", "Level02", "Level03", "Level04", "Level05", "Level06", "Level07", "Level08", "Level09", "Level10", "Level11", "Level12", "Level13", "Level14", "Level15", "Level16", "Level17", "Level18", "Level19", "Level20", "Level21"}, function(opt)
    settings().Rendering.QualityLevel = Enum.QualityLevel[opt]
    qualityLevel:UpdateLabel("[3]", tostring(settings().Rendering.QualityLevel))
end)
miscSec:NewDropdown("[4] Mesh Part Detail Level", "", {"DistanceBased", "Level00", "Level01", "Level02", "Level03", "Level04"}, function(opt)
    settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel[opt]
    meshPartDetailLevel:UpdateLabel("[4]", tostring(settings().Rendering.MeshPartDetailLevel))
end)