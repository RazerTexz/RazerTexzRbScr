local removeNametags = true -- remove custom billboardgui nametags from hrp, could trigger anticheat

local vector3New = Vector3.new

local plr = game:GetService("Players").LocalPlayer
local character = plr.Character
local hrp = character.HumanoidRootPart
local old = hrp.CFrame
local tag = hrp:FindFirstChildOfClass("BillboardGui")

if not character:FindFirstChild("LowerTorso") or character.PrimaryPart ~= hrp then return print("unsupported") end

if removeNametags then
    if tag then tag:Destroy() end
    hrp.ChildAdded:Connect(function(item)
        if item:IsA("BillboardGui") then item:Destroy() end
    end)
end

local newroot = character.LowerTorso.Root:Clone()
hrp.Parent = workspace
character.PrimaryPart = hrp
character:MoveTo(vector3New(old.X, 9e9, old.Z))
hrp.Parent = character
task.wait(0.5)
newroot.Parent = character.LowerTorso
hrp.CFrame = old

local starterGui = game:GetService("StarterGui")
starterGui:SetCore("SendNotification", {
    Title = "R15 Invisibility Script Is Enabled",
    Text = "ENABLED",
    Duration = 3
})