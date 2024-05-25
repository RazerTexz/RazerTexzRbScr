local placeId = game.PlaceId
local success, servers = pcall(function()
    return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?limit=100")).data
end)
if not success then return end
local lowestPingServer = servers[1]
for _, server in servers do
   if server["ping"] < lowestPingServer["ping"] then
       lowestPingServer = server
   end
end
local bF = Instance.new("BindableFunction")
bF.OnInvoke = function(opt)
    if opt == "Join" then game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, lowestPingServer.id) end
end
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Server found!",
    Text = "Found server with lowest ping of "..lowestPingServer["ping"],
    Duration = 10,
    Callback = bF,
    Button1 = "Join",
    Button2 = "Cancel"
})