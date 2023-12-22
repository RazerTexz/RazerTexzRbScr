local enabled = true
local spyOnMyself = false
local public = false
local publicItalics = false

local privateProperties = {
	Color = Color3.fromRGB(0, 255, 255),
	Font = Enum.Font.SourceSansBold,
	TextSize = 18
}

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
	plr.Chatted:Connect(function(msg) onChatted(plr, msg) end)
end

players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg) onChatted(plr, msg) end)
end)

privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
starterGui:SetCore("ChatMakeSystemMessage", privateProperties)
local chatFrame = localPlayer.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y)