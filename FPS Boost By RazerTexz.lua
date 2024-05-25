if not game:IsLoaded() then game.Loaded:Wait() end
sethiddenproperty(workspace, "ModelStreamingBehavior", Enum.ModelStreamingBehavior.Improved)
workspace.StreamingEnabled = true
sethiddenproperty(workspace, "StreamingIntegrityMode", Enum.StreamingIntegrityMode.MinimumRadiusPause)
sethiddenproperty(workspace, "StreamOutBehavior", Enum.StreamOutBehavior.Opportunistic)

--[[local lighting = game:GetService("Lighting")
lighting.GlobalShadows = false
lighting.FogEnd = 9e9
lighting.ShadowSoftness = 0
sethiddenproperty(lighting, "Technology", Enum.Technology.Compatibility))
print("Technology", gethiddenproperty(lighting, "Technology"))--]]

--settings().Rendering.GraphicsMode = Enum.GraphicsMode.Automatic
settings().Rendering.QualityLevel = 1
settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.DistanceBased

local function optimize(obj)
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        obj.Material = Enum.Material.Plastic
    end
end

game.DescendantAdded:Connect(function(obj)
    optimize(obj)
    task.wait(1)
end)

local amount = 500
for i, v in game:GetDescendants() do
    optimize(v)
    if i == amount then
        task.wait()
        amount += 500
    end
end