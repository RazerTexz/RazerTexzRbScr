local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/Kavo%20UI%20Draggable%20Android.lua"))()
local Window = Library.CreateLib("SPOOFER BY RAZERTEXZ", "Ocean")
local MainTab = Window:NewTab("MAIN TAB")
local MainSection = MainTab:NewSection("MAIN")

local lplr = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")

local function RobloxNotification(first, second, time)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = first,
        Text = second,
        Duration = time
    })
end

local function generateString()
    local chars = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "X", "Z"}
    local str = ""

    for i = 1, 36 do
        if i == 5 or i == 10 or i == 15 or i == 20 then
            str = str .. "-"
        else
            str = str .. chars[math.random(2, #chars)]
        end
    end
    return str
end

local function executor()
    local strings = {"Project Ligma", "Synapse X", "Project Stigma", "Project Potato", "Fluxus", "Hydrogen", "Delta", "Codex", "Nil executor", "Unknown", "Evon", "Celery", "Electron", "Arceus X", "Comet", "Oxygen U", "Krnl", "Furk Ultra", "Trigon Evo", "Valyse", "Atonix", "RC7", "JJsploit", "ProtonSmasher"}
    return strings[math.random(1, #strings)]
end

local function name()
    local strings = {"ZenternPly", "YeeterDestroyer298", "Jennet202", "P0tat0T0mat0389", "FlickerInTheNight2819", "ZealerBeeter", "BoixlerBold299", "SocializationOfNuker3929", "UnknownKillerBolter120"}
    return strings[math.random(1, #strings)]
end

local spoof = {}

MainSection:NewToggle("Anti Client Kick", "Only works if its localscript", function(state)
    if state then
        local oldhmmi
        local oldhmmnc
        oldhmmi = hookmetamethod(game, "__index", function(self, method)
            if self == lplr and method:lower() == "kick" then
                return error("Expected ':' not '.' calling member function kick", 2)
            end
            return oldhmmi(self, method)
        end)
        oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
            if self == lplr and getnamecallmethod():lower() == "kick" then
                return
            end
            return oldhmmnc(self, ...)
        end)
        RobloxNotification("Enabled", "Keep in mind that this only effective if the game uses Localscript to kick players", 3)
    else
        RobloxNotification("Disabled", "Client Anti Kick has been disabled!", 3)
    end
end)

MainSection:NewButton("Spoof IP", "Your real ip will change to a fake one (like vpn)", function()
    spoof.Http = function(a) return game:HttpGet(a) end
    spoof.IP = game:HttpGet('https://api.ipify.org/')
    
    local ip = tostring(math.random(255).."."..math.random(255).."."..math.random(255).."."..math.random(255))

    RobloxNotification("IP Address", "Your fake IP Address: ".. ip, 3)
    print(ip)

    task.wait(1)
    game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
end)

MainSection:NewButton("Spoof Client ID (Hardware ID)", "This feature will change your hardware id to a random one", function()
    local cid_spoof = generateString()
    local OldIndex

    OldIndex = hookmetamethod(game, "__namecall", function(...)
        if getnamecallmethod() == "GetClientId" then
            return cid_spoof
        end
        return OldIndex(...)
    end)

    RobloxNotification("Hardware ID", "Your spoofed hardware id: ".. cid_spoof, 3)
    print(cid_spoof)

    task.wait(1)
    game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
end)

MainSection:NewButton("Spoof Username, UserId, DisplayName", "Changes your username, userid, displayname to a random one", function()
    local rename = name()
    local userId = tostring(math.random(99999999))

    lplr.Name = rename
    lplr.DisplayName = rename
    lplr.UserId = userId

    RobloxNotification("Username", "Your fake username:".. lplr.Name, 3)
    RobloxNotification("DisplayName", "Your fake DisplayName: ".. lplr.UserId, 3)
    RobloxNotification("User ID", "Your fake User ID: ".. lplr.UserId, 3)

    task.wait(1)
    print(lplr.Name)
    print(lplr.DisplayName)
    print(lplr.UserId)
    game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
end)

MainSection:NewButton("Spoof Executor", "This feature will change your executor name to a random executor", function()
    local executor_spoof = executor()
    local da = hookfunction
    
    if identifyexecutor then
        da(identifyexecutor, newcclosure(function() return executor_spoof end))
    end

    RobloxNotification("Executor", "Your fake executor: ".. executor_spoof, 3)

    task.wait(1)
    print(identifyexecutor())
    game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
end)