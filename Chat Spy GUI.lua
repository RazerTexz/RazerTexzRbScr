local enabled = true
local spyOnMyself = false
local public = false
local publicItalics = false

local privateProperties = {
	Color = Color3.fromRGB(0, 255, 255),
	Font = Enum.Font.SourceSansBold,
	TextSize = 18
}

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/RazerTexz/RazerTexzRbScr/main/DrRay%20UI%20Library%20Modded%20By%20RazerTexz.lua"))()
local window = DrRayLibrary:Load("Chat Spy GUI", "Default")
local tab = DrRayLibrary.newTab("Main", "")
tab.newToggle("Enabled", "", true, function(state) enabled = state end)
tab.newToggle("Spy On Myself", "", false, function(state) spyOnMyself = state end)
tab.newToggle("Public", "Show to other players", false, function(state) public = state end)
tab.newToggle("Public Italics", "Use /me to stand out more", false, function(state) publicItalics = state end)
tab.newButton("Destroy GUI", "", function() game:GetService("CoreGui"):FindFirstChild("DrRay"):Destroy() end)

local starterGui = game:GetService("StarterGui")
local players = game:GetService("Players")
local getPlayers = players.GetPlayers
local localPlayer = players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (getgenv().chatSpyInstance or 0) + 1
getgenv().chatSpyInstance = instance

local function onChatted(player, msg)
	if chatSpyInstance == instance then
		if player == localPlayer and msg:lower():sub(1, 4) == "/spy" then
			enabled = not enabled
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			starterGui:SetCore("ChatMakeSystemMessage", privateProperties)
		elseif enabled and (spyOnMyself == true or player ~= localPlayer) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
				if packet.SpeakerUserId == player.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and (channel == "All" or (channel == "Team" and public == false and players[packet.FromSpeaker].Team == localPlayer.Team)) then
					hidden = false
				end
			end)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. player.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. player.Name .."]: "..msg
					starterGui:SetCore("ChatMakeSystemMessage", privateProperties)
				end
			end
		end
	end
end

for _, plr in pairs(getPlayers()) do
	plr.Chatted:Connect(function(msg)
	    onChatted(plr, msg)
	end)
end

players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
	    onChatted(plr, msg)
	end)
end)

privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
starterGui:SetCore("ChatMakeSystemMessage", privateProperties)
local chatFrame = localPlayer.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y)