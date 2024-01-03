local color3FromRgb = Color3.fromRGB
local udim2New = UDim2.new
local udimNew = UDim.new

-- This script reveals ALL hidden messages in the default chat
local enabled = true -- Chat "/spy" to toggle!
local spyOnMyself = true -- If true will check your messages too
local public = false -- If true will chat the logs publicly (fun, risky)
local publicItalics = true -- If true will use /me to stand out
local privateProperties = { -- Customize private logs
	Color = color3FromRgb(0, 255, 255),
	Font = Enum.Font.SourceSansBold,
	TextSize = 18
}

local starterGui = game:GetService("StarterGui")
local plrs = game:GetService("Players")
local getPlayers = plrs:GetPlayers()
local player = plrs.LocalPlayer or plrs:GetPropertyChangedSignal("LocalPlayer"):Wait()
local saymsg = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
local getmsg = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering
local instance = (getgenv().chatSpyInstance or 0) + 1
getgenv().chatSpyInstance = instance

local function onChatted(plr, msg)
	if _G.chatSpyInstance == instance then
		if plr == player and msg:lower():sub(1, 4) == "/spy" then
			enabled = not enabled
			task.wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			starterGui:SetCore("ChatMakeSystemMessage", privateProperties)
		elseif enabled and (spyOnMyself or plr ~= player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn
		    conn = getmsg.OnClientEvent:Connect(function(packet, channel)
				if packet.SpeakerUserId == plr.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and (channel == "All" or (channel == "Team" and not public and plrs[packet.FromSpeaker].Team == player.Team)) then hidden = false end
			end)
			task.wait(1)
			conn:Disconnect()
			conn = nil
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} ["..p.Name.."]: "..msg, "All")
				else
					privateProperties.Text = "{SPY} ["..p.Name.."]: "..msg
					starterGui:SetCore("ChatMakeSystemMessage", privateProperties)
				end
			end
		end
	end
end

for _, v in getPlayers do
	v.Chatted:Connect(function(msg) onChatted(v, msg) end)
end
plrs.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg) onChatted(plr, msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
starterGui:SetCore("ChatMakeSystemMessage", privateProperties)
if not player.PlayerGui:FindFirstChild("Chat") then task.wait(3) end
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + udim2New(udimNew(), chatFrame.ChatChannelParentFrame.Size.Y)