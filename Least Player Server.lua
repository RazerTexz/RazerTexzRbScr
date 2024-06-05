local placeId = game.PlaceId
local server, next
local success, servers = pcall(function()
    return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"..((next and "&cursor="..next) or "")))
end)
if not success then return end
repeat
    server = servers.data[1]
    next = servers.nextPageCursor
until server
local bF = Instance.new("BindableFunction")
bF.OnInvoke = function(opt)
    if opt == "Join" then game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, server.id, game:GetService("Players").LocalPlayer) end
end
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Server found!",
    Text = "Found server with lowest players of "..server["playing"],
    Duration = 10,
    Callback = bF,
    Button1 = "Join",
    Button2 = "Cancel"
})